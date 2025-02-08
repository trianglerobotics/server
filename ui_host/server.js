// const express = require('express');
// const path = require('path');
// const cors = require('cors'); 

import express from 'express';
import path from 'path';
import cors from 'cors';

const app = express();
const port = process.env.PORT || 3000;

// Enable CORS (Adjust as needed)
app.use(cors({
  origin: '*', // Allow all origins (change this if needed)
  methods: ['GET', 'POST', 'OPTIONS']
}));

import { fileURLToPath } from 'url';
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

app.use(express.static(path.join(__dirname, 'build')));
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});


// Start the server
app.listen(port, () => {
  console.log(`🚀 Server running on port ${port}`);
});
