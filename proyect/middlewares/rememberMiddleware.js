const fs = require('fs');
const path = require('path');

const usersDB = path.join(__dirname, '../data/usersDB.json');

var users = JSON.parse(fs.readFileSync("./database/users.json", {encoding: 'utf-8'}))

function recuerdameMiddleware (req,res, next){

    for(var i=0; i= users.length; i++){
        if(users[i].email == req.cookies.recuerdame){
            req.session.logueado = users[i];
            break;
        }
        };
}


module.exports = recuerdameMiddleware;