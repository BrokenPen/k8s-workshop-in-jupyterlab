const http = require('http');
const os = require('os');

console.log("Kubia server starting...");

var handler = function(request, response) {
  console.log("Received request from " + request.connection.remoteAddress);
  response.writeHead(200);

  let date_ob = new Date();
  let date = ("0" + date_ob.getDate()).slice(-2);
  let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
  let year = date_ob.getFullYear();
  let hours = date_ob.getHours();
  let minutes = date_ob.getMinutes();
  let seconds = date_ob.getSeconds();
  let datetime = (year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds);
  response.end("You've hit " + os.hostname() + "\n"
    + "The client's IP address is: " + request.socket.remoteAddress +"\n"
    + "Current time is : " + datetime +"\n"
  );
};

var www = http.createServer(handler);
www.listen(8080);
