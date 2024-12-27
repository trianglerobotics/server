import cors from 'cors';
import express from 'express';
import http from 'http';  // <-- You need to import http
import os from 'os';
import WebSocket, { WebSocketServer } from "ws";
import { promises} from 'fs';
import util from 'util';
import { exec } from 'child_process';
import wifi from 'node-wifi';
import helmet from 'helmet';
import path from 'path';
import fs from 'fs'
import unzipper from 'unzipper'
import fse from 'fs-extra';
import axios from 'axios';

const version = 1.1;

const execAsync = util.promisify(exec);
const app = express();
const server = http.createServer(app);
const port = 5000;
const home = os.homedir();

const wss = new WebSocketServer({ port: 1124 })
wss.on('connection', ws => {
  });

wifi.init({
    iface: null // network interface, choose a random wifi interface if set to null
});

app.use(cors({ origin: '*' }));

app.use(helmet());

app.use(
    helmet.contentSecurityPolicy({
      directives: {
        defaultSrc: ["'self'"],
        connectSrc: ["'self'", "http://121.184.63.113:5000"], // Allow external API
        // Other CSP directives as needed
      },
    })
);

async function handleWifiConnection(ssid, password, sudoPassword) {
  try {
    const result = await connectToWifi(ssid, password, sudoPassword);
    // console.log(result);

    // Wi-Fi is connected, now perform the next action
    console.log('Wi-Fi connection successful, proceeding with next steps...');
    // You can trigger the next action here after successful connection
  } catch (error) {
    console.error('Failed to connect to Wi-Fi:', error);
    // Handle the error case here (retry, show message, etc.)
  }
}

function prepareBroadcastData(status, stdout, stderr) {
  return {
      status: status || "unknown", // Default value if status is undefined
      info: stdout || "", // Default to an empty string if stdout is undefined
      info2: stderr || "" // Default to an empty string if stderr is undefined
  };
}

function broadcast(message) {
    wss.clients.forEach(client => {
        if (client.readyState === WebSocket.OPEN) {
            client.send(JSON.stringify(message)); // Convert message to JSON string
        }
    });
}

function checkWifiConnection() {
    return new Promise((resolve, reject) => {
      const command = `nmcli -t -f ACTIVE,SSID dev wifi`;
  
      exec(command, (error, stdout, stderr) => {
          if (error) {
              console.error(`Error checking Wi-Fi connection: ${error.message}`);
              return reject(error);
          }
          if (stderr) {
              console.error(`stderr: ${stderr}`);
              return reject(stderr);
          }
  
          const lines = stdout.trim().split('\n');
          const connectedWifi = lines.find(line => line.startsWith('yes'));
          
          if (connectedWifi) {
              const ssid = connectedWifi.split(':')[1]; // Get SSID
              console.log(`Connected to Wi-Fi: ${ssid}`);
              resolve(ssid); // Resolve with the SSID
          } else {
              console.log('Not connected to any Wi-Fi network.');
              resolve(false); // Resolve with false if not connected
          }
      });
  });
}

function connectToWifi(ssid, password, sudoPassword) {
    return new Promise((resolve, reject) => {
      const command = `echo '${sudoPassword}' | sudo -S nmcli device wifi connect "${ssid}" password "${password}"`;
  
      console.log('Executing command:', command);
  
      exec(command, (error, stdout, stderr) => {
        if (error) {
          console.error(`Error connecting to Wi-Fi: ${error.message}`);
          reject(`Error: ${error.message}`);
          return;
        }
        if (stderr) {
          console.error(`stderr: ${stderr}`);
          reject(`Error: ${stderr}`);
          return;
        }
  
        resolve('Connected to Wi-Fi');
      });
    });
}

  
const executecommand = async (command) => {
try {
    let { stdout, stderr } = await execAsync(`${command}`);

    // console.log(`cd ${home}/server/${target} && git pull origin main`)
    // Log the outputs
    console.log('Finished');
    console.log("Standard Output:", stdout);

    // Check if there is any error output
    if (stderr) {
    console.error("Standard Error:", stderr);
    }

} catch (error) {
    // In case the command fails (e.g., Git not found, directory not existing)
    console.error("Error:", error);
}
}

app.get('/api/version', (req, res) => {
    res.send({ version });
  })

app.get('/api/control/get/networks', async (req, res) => {
    try {
      // Check if the device is connected to Wi-Fi
      const connectedWifi = await checkWifiConnection();
      console.log('search')
  
      // Scan for available networks, regardless of the connection status
      wifi.scan((error, networks) => {
        if (error) {
          return res.status(500).json({ error: 'Failed to scan Wi-Fi networks' });
        } else {
            // console.log(networks);
          // Send both the connected Wi-Fi status and available networks
          return res.status(200).json({
            connected: connectedWifi ? true : false, // Indicates if connected to Wi-Fi
            connectedWifi: connectedWifi || null, // The SSID of the connected Wi-Fi, or null if not connected
            networks: networks // List of available networks
          });
        }
      });
    } catch (error) {
      console.error(`Error: ${error}`);
      return res.status(500).json({ error: 'An unexpected error occurred' });
    }
});


app.get('/api/control/disconn/networks/:selectedNetwork', async (req, res) => {
  const ssid = req.params.selectedNetwork;
  const command = `echo 1111 | sudo -S nmcli device disconnect wlan0`;

  console.log('Executing command:', command);

  exec(command, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error disconnecting from Wi-Fi: ${error.message}`);
      return res.status(500).json({ message: `Error: ${error.message}` });
    }
    if (stderr) {
      console.error(`stderr: ${stderr}`);
      return res.status(500).json({ message: `Error: ${stderr}` });
    }

    console.log(`Disconnected from Wi-Fi: ${stdout}`);
    return res.status(200).json({ message: `Successfully disconnected from Wi-Fi` });
  });
});

app.get('/api/control/conn/networks/:selectedNetwork/:password', async (req, res) => {
    const network = req.params.selectedNetwork;
    const password = req.params.password;
  
    console.log('Trying to connect to:', network, password);
  
    try {
      // Wait for the Wi-Fi connection attempt
      const result = await handleWifiConnection(network, password, '1111'); // Replace '1111' with the actual sudo password if needed
      console.log('Connection result:', result);
  
      // Send the connection result back to the client
      res.status(200).json({ message: 'Wi-Fi connection successful', result });
    } catch (error) {
      console.error('Failed to connect to Wi-Fi:', error);
  
      // Send an error response to the client
      res.status(500).json({ message: 'Failed to connect to Wi-Fi', error: error.message });
    }
});

async function installUpdatedFiles(downloadedPath, targetPath) {
  try {
      console.log(`Installing updated files from ${downloadedPath} to ${targetPath}...`);

      // Step 1: Ensure the target directory exists
      if (await fse.pathExists(targetPath)) {
          console.log(`Clearing target directory: ${targetPath}...`);
          
          // Delete the entire directory and recreate it to ensure a fresh state
          await fse.remove(targetPath);
          await fse.ensureDir(targetPath);
      } else {
          console.log(`Target directory does not exist, creating: ${targetPath}...`);
          await fse.ensureDir(targetPath);
      }

      // Step 2: Copy the new files
      console.log(`Copying new files from ${downloadedPath} to ${targetPath}...`);
      await fse.copy(downloadedPath, targetPath, { overwrite: true });

      console.log('Files installed successfully!');
      //exit

      

  } catch (error) {
      console.error(`Error installing updated files: ${error.message}`);
  }
}

const checkversion = async () => {
  try {
    const version = axios.get('http://http://141.164.60.140:7000/api/version');
    return  version;
  } catch (error) {
    console.error(`Error: ${error}`);
  }
}

app.get('/api/control/update', async (req, res) => {

    console.log('try to update');

    const downloadUrl = 'http://141.164.60.140:7000/download/update.zip'; // Replace with the actual file URL
    const tempFolder = '/tmp'; // Temporary directory
    const zipFilePath = path.join(tempFolder, 'update.zip'); // Path to save the zip file
    const extractedFolderPath = path.join(tempFolder, 'update'); // Path to extract the zip file
    try {

        // Step 1: Download file to the /tmp
        // Status = Downloading
        try {
          console.log(`Downloading file from ${downloadUrl}`);
          await new Promise((resolve, reject) => {
              const file = fs.createWriteStream(zipFilePath);
              http.get(downloadUrl, (response) => {
                  if (response.statusCode !== 200) {
                      reject(new Error(`Failed to download file: ${response.statusCode}`));
                      return;
                  }

                  const totalBytes = parseInt(response.headers['content-length'], 10);
                  let downloadedBytes = 0;

                  response.on('data', (chunk) => {
                      downloadedBytes += chunk.length;
                      const percentage = ((downloadedBytes / totalBytes) * 100).toFixed(2);
                      process.stdout.write(`Downloaded: ${percentage}%\r`);
                      const broadcast_data = prepareBroadcastData('downloading', `Downloading : ${percentage}%`, '');
                      broadcast(broadcast_data);
                  });

                  response.pipe(file);

                  file.on('finish', () => {
                      file.close(resolve);
                      console.log(`\nFile downloaded successfully to ${zipFilePath}`);
                  });
              }).on('error', (error) => {
                  fs.unlink(zipFilePath, () => reject(error));
              });
          });
        } catch (error) {
          console.error(`Error downloading file: ${error.message}`);
          return; // Stop execution if download fails
        }


        const broadcast_data2 = prepareBroadcastData('', `Unzipping`, '');
        broadcast(broadcast_data2);
        

        // Step 2: Unzip file to the /tmp/update
        // Status = Unzipping
        try {
          console.log(`Unzipping file: ${zipFilePath} to ${extractedFolderPath}`);
          await fs.createReadStream(zipFilePath)
              .pipe(unzipper.Extract({ path: extractedFolderPath }))
              .promise();
          console.log('Unzipping completed successfully.');
        } catch (error) {
          console.error(`Error unzipping file: ${error.message}`);
        }

        // status: Install updated files

        const broadcast_data3 = prepareBroadcastData('', `installing`, '');
        broadcast(broadcast_data3);

        // Step 3: Install updated files
        await installUpdatedFiles("/tmp/update/server/examples",`${home}/server/examples`) //examples
        await installUpdatedFiles("/tmp/update/server/models",`${home}/server/models`) // models
        await installUpdatedFiles("/tmp/update/server/sv_host",`${home}/server/sv_host`) //sv_host
        await installUpdatedFiles("/tmp/update/server/ui_host",`${home}/server/ui_host`) //ui_host
        await installUpdatedFiles("/tmp/update/server/updatedb",`${home}/server/updatedb`) //updatedb


        // Step 4: Update DB
        await executecommand('echo 1111 | sudo -S chmod 777 ~/server/updatedb/updatemysql.sh')
        await executecommand('echo 1111 | sudo -S ~/server/updatedb/updatemysql.sh')

        // Step 4: Restart services
          //1. ui_host
          //2. sv_host
        await executecommand('echo 1111 | sudo -S systemctl restart jc_sv.service')
        await executecommand('echo 1111 | sudo -S systemctl restart jc_ui.service')

        // Step 5: Cleanup

        let broadcast_data = prepareBroadcastData('finished', 'starting', 'stderr');
        broadcast(broadcast_data);

      }
    catch{
      
    }

  });

server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
