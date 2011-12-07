var zombie = require("zombie");
var url = "http://www.columbia.edu/acis/facilities/printers/ninja_status.html";

zombie.visit(url, function (err, browser, status) {
    var printers = browser.document.querySelectorAll("td:first-child");
    var output = [];
    for (var i = 0; i < printers.length; i++) {
            output.push(printers[i].childNodes[0].nodeValue);
    }
    console.log(JSON.stringify(output));
});