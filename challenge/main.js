const fs = require('fs');

class Main {
  constructor() {
    this._leads = {};
  }

  watch() {
    setInterval(() => {
      fs.readdir('tmp', (err, files) => {
        files.forEach(file => {
          const fileSrc = `./tmp/${file}`;
          
          fs.readFile(fileSrc, (err, leads) => {
            if (err) throw err;
        
            this._addLeads(leads);
            this._removeFile(fileSrc);
            this._updateLeadsBase();
          });
        });
      });
    }, 1000);
  }

  _addLeads(data) {
    const leads = JSON.parse(data);

    leads.forEach((email) => {
      if (this._leads[email]) {
        this._leads[email] = this._leads[email] + 1;
      } else {
        this._leads[email] = 1;
      }
    });
  }

  _removeFile(fileSrc) {
    fs.unlink(fileSrc, (err) => {
      if (err) throw err;
    });
  }

  _updateLeadsBase() {
    fs.writeFile('./leads-base.txt', JSON.stringify(this._leads), (err) => {
      if (err) throw err;
    });
  }
}

new Main().watch();