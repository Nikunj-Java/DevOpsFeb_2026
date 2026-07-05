// Import the built-in HTTP module
const http = require('http');

// Define the server host and port
const hostname = '127.0.0.1';
const port = 3001;

// Create the HTTP server instance
const server = http.createServer((req, res) => {
  // Set the response HTTP status and Content-Type header
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  
  // Send the response text and close the connection
  res.end('Hello, World!\n');
});

// Start listening for incoming network requests
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
