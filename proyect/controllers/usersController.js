const fs = require('fs');
const path = require('path');

var products = JSON.parse(fs.readFileSync("./database/users.json"))

var controller = {

    createUser: function (req,res,next) {

},

    confirmUser: function (req,res, next) {

    }
}













module.exports = controller