var page = new WebPage();
var url = "http://www.columbia.edu/acis/facilities/printers/locations.html";

page.open(url, function (status) {
    console.log(page.evaluate(function () {
        return JSON.stringify(printers);
    }));
    phantom.exit();
});