const http = require('http');

class LeadsManager {
  constructor() {
    this._leads = {};
    this._showTotal();
  }

  addLeads(leads) {
    leads.forEach((email) => {
      if (this._leads[email]) {
        this._leads[email] = this._leads[email] + 1;
      } else {
        this._leads[email] = 1;
      }
    });
  }

  _showTotal() {
    setInterval(() => console.log(this._leads), 5000);
  }
}

const leadsManager = new LeadsManager();

class LeadsAPI {
  constructor() {
    this._leadsQueue = [];
    this._leadsCollector();
  }

  listen(port = 8080) {
    const server = http.createServer((req, res) => this._server(req, res)).listen(port);
  }

  _server(req, res) {
    req.on('data', data => this._serverRequest(data));
    req.on('end', () => this._serverResponse(res));
  }

  _serverRequest(data) {
    const { email } = JSON.parse(data.toString());
    this._pushLead(email);
  }

  _serverResponse(res) {
    res.writeHead(200, 'OK', { 'Content-Type': 'text/html' });
    res.end('E-mail cadastrado com sucesso!');
  }

  _pushLead(email) {
    this._leadsQueue.push(email);
  }

  _leadsCollector() {
    setInterval(() => {
      leadsManager.addLeads(this._leadsQueue);
      this._leadsQueue = [];
    }, 1000);
  }
}

new LeadsAPI().listen(8081);
new LeadsAPI().listen(8082);
new LeadsAPI().listen(8083);