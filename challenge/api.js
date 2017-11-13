const http = require('http');
const fs = require('fs');
const uuid = require('uuid/v4');

class Api {
  constructor() {
    this._leadsQueue = [];
    this._leadsCollector();
  }

  listen() {
    http.createServer((req, res) => this._server(req, res)).listen(8080);
  }

  _server(req, res) {
    req.on('data', data => this._serverRequest(data));
    req.on('end', () => this._serverResponse(res));
  }

  _serverRequest(data) {
    const { email } = JSON.parse(data.toString());
    this._leadsQueue.push(email);
    console.log(`${email} registered!`);
  }

  _serverResponse(res) {
    res.writeHead(200, 'OK', { 'Content-Type': 'text/html' });
    res.end('Done!');
  }
  
  _leadsCollector() {
    setInterval(() => {
      if (this._leadsQueue.length === 0) return;

      fs.writeFile(`tmp/${uuid()}.txt`, JSON.stringify(this._leadsQueue), (err) => {
        if (err) throw err;
      });

      this._leadsQueue = [];
    }, 2000);
  }
}

new Api().listen();