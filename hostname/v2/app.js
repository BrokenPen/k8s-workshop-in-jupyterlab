const http = require('http');
const os = require('os');

console.log("Kubia server starting...");

var handler = function(request, response) {
  console.log("Received request from " + request.connection.remoteAddress);
  response.writeHead(200);
  response.end("You've hit " + os.hostname() + "\n"
    + "The client's IP address is: " + request.socket.remoteAddress
  );
};

var www = http.createServer(handler);
www.listen(8080);
