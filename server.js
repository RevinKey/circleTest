  
var http = require('http')

var port = 4000

var server = http.createServer(function (request, response) {
  response.writeHead(200, {'Content-Type': 'text/plain'})
  response.end(`Hello World: This is a ${process.env.STRING_FOR_TEST}`)
})

server.listen(port)

//THIS IS A COMMENT
// TEST!
// one more!
console.log('Server running on port' + port)
