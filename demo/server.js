const expess = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');

const app = expess();

app.use(bodyParser.urlencoded({ extended: true, limit: '50mb' }));

app.post('/image', function(req, res) {
    let name = req.body.name;
    let img = req.body.image;
    let realFile = Buffer.from(img, 'base64');
    fs.writeFile(name, realFile, function(err) {
        if (err) console.log(err);
    });
    res.send('OK');
});

app.listen(3000);
