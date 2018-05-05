

var fs = require('fs'),
  xml2js = require('xml2js'),
  util = require('util');

var parser = new xml2js.Parser();
fs.readFile(__dirname + '/.idea/inspectionProfiles/Project_Default.xml', function(err, data) {
  parser.parseString(data, function (err, result) {
    console.dir((result.component.profile));
    console.log('Done');
  });
});