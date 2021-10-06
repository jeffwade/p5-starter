const http = require('http');
const hostname = 'localhost';
const port = 3000;

const url = require('url');
const path = require('path');
const fs = require('fs');

const server = http.createServer( (req, res) => {
    let pathname = req.url;
    if ( pathname == '/' ) {
      pathname = '/index.html';
    }

    let ext = path.extname(pathname);

    // Map extension to filetype
    let typeExt = {
      '.html': 'text/html',
      '.js': 'text/javascript',
      '.css': 'text/css'
    };

    // What is it? Default to plain text
    let contentType = typeExt[ext] || 'text/plain';

    // User filesystem module
    fs.readFile(__dirname + pathname,
      (err, data) => {
        if ( err ) {
          res.writeHead(500);
          return res.end(`Error loading ${pathname}`);
        }
        res.writeHead(200, {'Content-Type': contentType});
        res.end(data);
      }
    );
  }
);

server.listen(port, hostname, () => {
  console.log( `Server running at http://${hostname}:${port}` );
});
