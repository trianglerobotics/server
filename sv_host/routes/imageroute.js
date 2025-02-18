import express from 'express';
import { spawn } from 'child_process';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';
import WebSocket from 'ws';
import chokidar from 'chokidar';
import { getDatabases,addImage } from '../database.js'; // 확장자 .js 추가
import router from './databaseroute.js';
import os from 'os';

let pythonProcess = null;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Define the path to the Python script
let pythonScriptPath = path.resolve(__dirname, '../python/stream.py');

function startPythonScript(dbtype) {
    if(pythonProcess) {
        //console.log('Python script is already running');
        return;
    }

    if(dbtype === 'objectdetection')
    {
        pythonScriptPath = path.resolve(__dirname, '../python/stream_yolo.py');
    }
    else if(dbtype === 'classification' || dbtype === 'custom')
    {
        pythonScriptPath = path.resolve(__dirname, '../python/stream_yolo.py');
    }

    else if(dbtype === 'racing')
    {
        pythonScriptPath = path.resolve(__dirname, '../python/stream_racing.py');
    }

    console.log('Starting Python script:', pythonScriptPath);

    pythonProcess = spawn('python3', [pythonScriptPath]);

    pythonProcess.stdout.on('data', (data) => {
        console.log(`Python stdout: ${data}`);
    });

    pythonProcess.stderr.on('data', (data) => {
        console.error(`Python stderr: ${data}`);
    });

    pythonProcess.on('close', (code) => {
        //console.log(`Python script exited with code ${code}`);
        pythonProcess = null;
    });

    //console.log('Python script started');
}

// Function to stop the Python script
function stopPythonScript() {
    if (pythonProcess) {
        pythonProcess.kill('SIGINT'); // Send SIGINT to stop the Python script
        console.log('Python script stopped');
    } else {
        console.log('Python script is not running');
    }
}

router.get('/api/image/stream-start/:dbtype', (req, res) => {

    const {dbtype} = req.params;
    //console.log(dbtype);
    if (pythonProcess) {
        res.status(400).json({ success: false, message: 'Python script is already running' });
    } else {
        startPythonScript(dbtype);

        res.json({ success: true, message: 'Python script started' });
    }
});

router.get('/api/image/stream-stop', (req, res) => {
    if (pythonProcess) {
        stopPythonScript();
        res.json({ success: true, message: 'Python script stopped' });
    } else {
        res.status(400).json({ success: false, message: 'Python script is not running' });
    }
});

// router.post('/api/image/get/image', (req, res) => {
//     const project = req.body.project;
//     const path = req.body.path;
//     //home = os.homedir();
//     //const imgpath = path.join(home,'server','projects',project,'databases','data',path);
//     //console.log(imgpath);
//     // fs.access(imgpath, fs.constants.F_OK, (err) => {
//     //     if (err) {
//     //         console.error("File does not exist:", fullPath);
//     //         return res.status(404).json({ error: 'Image not found' });
//     //     }

//     //     // Send the file
//     //     res.sendFile(fullPath, (err) => {
//     //         if (err) {
//     //             console.error("Error sending file:", err);
//     //             res.status(500).json({ error: 'Error sending the image' });
//     //         }
//     //     });
//     // });
//     res.json({ success: true, message: 'Image saved successfully', imgpath });

//     console.log("project: ", project);
//     console.log("path: ", path);
// });

router.post('/api/image/get/image', (req, res) => {
    const project = req.body.project;
    const relativePath = req.body.path;

    const home = os.homedir();

    const imgpath = path.join(home, 'server', 'projects', project, relativePath);

    //console.log("Full image path:", imgpath);
    fs.access(imgpath, fs.constants.F_OK, (err) => {
        if (err) {
            console.error("File does not exist:", imgpath);
            return res.status(404).json({ error: 'Image not found' });
        }

        // Send the file to the client
        res.sendFile(imgpath, (err) => {
            if (err) {
                console.error("Error sending file:", err);
                res.status(500).json({ error: 'Error sending the image' });
            }
        });
    });


    //res.json({ success: true, message: 'Image saved successfully', relativePath });

    // Assuming the images are stored in a specific directory relative to your server
    //const imgpath = path.join(__dirname, 'projects', project, 'databases', 'data', relativePath);

    //console.log("Full image path:", imgpath);

    // Check if the file exists and send it
    // fs.access(imgpath, fs.constants.F_OK, (err) => {
    //     if (err) {
    //         console.error("File does not exist:", imgpath);
    //         return res.status(404).json({ error: 'Image not found' });
    //     }

    //     // Send the file to the client
    //     res.sendFile(imgpath, (err) => {
    //         if (err) {
    //             console.error("Error sending file:", err);
    //             res.status(500).json({ error: 'Error sending the image' });
    //         }
    //     });
    // });
});

router.post('/api/image/save/image', (req, res) => {
    const image = req.body.image; // Ensure you are accessing image from body
    const project = req.body.project;
    const speed = req.body.speed;
    const leftangle = req.body.leftangle;
    const rightangle = req.body.rightangle;
    const classid = req.body.classid;
    const savetype = req.body.savetype;
    const dbtype = req.body.dbtype;
    const home = os.homedir();
    if (!image) {
        return res.status(400).json({ success: false, message: 'Image data is required' });
    }
    //console.log("try to save2")
    const imagename = `${Date.now()}_${leftangle}${rightangle}${speed}.jpg`;
    const buffer = Buffer.from(image, 'base64'); // Decode base64 image
    const filePath = path.join(home ,'server' ,'projects',req.body.project,'databases','data',req.body.classid, imagename); // Create a unique file name

      fs.writeFile(filePath, buffer, (err) => {
        if (err) {
          console.error('Error saving image:', err);
          return res.status(500).json({ success: false, message: 'Error saving image' });
        }
        if(dbtype == 'objectdetection')
        {
            //console.log(imagename,'dfdfdfdfd')
            addImage(imagename,project);
        }
        //save to database
        res.json({ success: true, message: 'Image saved successfully', filePath });
      });
});

router.post('/api/image/delete/image', (req, res) => {
    const image = req.body.image; // Ensure you are accessing image from body
    const project = req.body.project;
    const dbtype = req.body.dbtype;
    const home = os.homedir();

    //console.log(project,image);
    const imagePath = path.join(home,'server','projects', project, 'databases', 'data', image);
    console.log(imagePath);
    fs.access(imagePath, fs.constants.F_OK, (err) => {
        if (err) {
            // Sends a response if the file is not found
            return res.status(404).json({ success: false, message: 'File not found' });
        }
    
        // Attempts to delete the file
        fs.unlink(imagePath, (unlinkErr) => {
            if (unlinkErr) {
                // Sends a second response if the deletion fails
                return res.status(500).json({ success: false, message: 'Failed to delete file' });
            }
    
            // Sends a third response if the file is deleted successfully
            res.json({ success: true, message: 'Image deleted successfully' });
        });
    });
});

// module.exports = router;
export default router;