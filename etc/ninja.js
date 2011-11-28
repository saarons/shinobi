var zombie = require("zombie");
var url = "http://www.columbia.edu/acis/facilities/printers/locations.html";

zombie.visit(url, function (err, browser, status) {
  console.log(JSON.stringify(browser.evaluate("printers")));
});