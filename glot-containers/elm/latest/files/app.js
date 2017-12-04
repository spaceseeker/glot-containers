//var jsdom = require("jsdom").jsdom;
//document = jsdom();

var jsdom = require('jsdom');
const { JSDOM } = jsdom;

const { document } = (new JSDOM('')).window;
global.document = document;

var elm = require("./elm.js");
elm.Main.fullscreen();

setTimeout(function() {
  var content = document.body.innerHTML;
  process.stdout.write(content);
}, 0);
