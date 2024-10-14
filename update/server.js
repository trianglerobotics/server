import cors from 'cors';
import express from 'express';
import http from 'http';  // <-- You need to import http
import os from 'os';
import WebSocket, { WebSocketServer } from "ws";
import { promises as fs } from 'fs';
import util from 'util';
import { exec } from 'child_process';
import wifi from 'node-wifi';
import helmet from 'helmet';
// import csp from "helmet-csp";

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
  
// function broadcast(message) {
//     wss.clients.forEach(client => {
//     if (client.readyState === WebSocket.OPEN) {
//     client.send(message);
//     }
// });
// }
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
  
        // console.log(`Connected to Wi-Fi: ${stdout}`);
        resolve('Connected to Wi-Fi');
      });
    });
}

function prepareBroadcastData(status, stdout, stderr) {
    return {
        status: status || "unknown", // Default value if status is undefined
        info: stdout || "", // Default to an empty string if stdout is undefined
        info2: stderr || "" // Default to an empty string if stderr is undefined
    };
}

const executeUpdate = async (target) => {
    try {
      let { stdout, stderr } = await execAsync(`cd ${home}/server/${target} && git pull origin main`);
  
      console.log(`cd ${home}/server/${target} && git pull origin main`)
      // Log the outputs
      console.log('Finished');
      console.log("Standard Output:", stdout);

      let broadcast_data = prepareBroadcastData(target, stdout, stderr);
      broadcast(broadcast_data);
  
      // Check if there is any error output
      if (stderr) {
        console.error("Standard Error:", stderr);
      }
  
      // Simple success check based on the presence of certain words in stdout
      if (stdout.includes("Already up to date") || stdout.includes("Updating")) {
        console.log("Git pull executed successfully!");
      } else {
        console.log("Git pull might have encountered an issue.");
      }
  
    } catch (error) {
      // In case the command fails (e.g., Git not found, directory not existing)
      console.error("Error executing git pull:", error);
    }
};
  
const executedbupdate = async () => {
try {
    let { stdout, stderr } = await execAsync(`${home}/server/updatedb/updatemysql.sh`);

    // console.log(`cd ${home}/server/${target} && git pull origin main`)
    // Log the outputs
    console.log('Finished');
    console.log("Standard Output:", stdout);

    // Check if there is any error output
    if (stderr) {
    console.error("Standard Error:", stderr);
    }

    // Simple success check based on the presence of certain words in stdout
    if (stdout.includes("Already up to date") || stdout.includes("Updating")) {
    console.log("Git pull executed successfully!");
    } else {
    console.log("Git pull might have encountered an issue.");
    }

} catch (error) {
    // In case the command fails (e.g., Git not found, directory not existing)
    console.error("Error executing git pull:", error);
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
            console.log(networks);
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

app.get('/api/control/update', async (req, res) => {

    console.log('update');
  
    (async () => {
      try {
        //broadcast('update examples');
        await executeUpdate('examples');
  
        //broadcast('update models');
        await executeUpdate('models');
  
        //broadcast('update ui_host');
        await executeUpdate('ui_host');
  
        //broadcast('update sv_host');
        await executeUpdate('sv_host');
  
        //broadcast('downloading updatedb...');
        await executeUpdate('updatedb');
        //broadcast('fetching updatedb...');
        await executedbupdate();

        let broadcast_data = prepareBroadcastData('finished', 'stdout', 'stderr');
        broadcast(broadcast_data);
  
        //broadcast('finished');
        console.log('Update complete.');
  
      } catch (err) {
        console.error('Download failed:', err.message);
      }
    })();
  
    res.status(200).json({'message': 'update success'});
  });

server.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
