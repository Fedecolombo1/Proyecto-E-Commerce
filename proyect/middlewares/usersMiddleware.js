const bcrypt = require("bcrypt")
const fs = require("fs")

var users = JSON.parse(fs.readFileSync("./database/users.json"))

var middleware = {

    register: function(res, req, next){

    },

    login: function(req, res, next){
        pass = bcrypt.hashSync("hola" , 10)
        console.log(pass);
        /*  for(var i = 0; i < users.length; i++){
            if(bcrypt.compareSync(req.body.password, users[i].password) && req.body.email == user[i].email)){
                req.session.usuario = "logueado"
                next();
            } else {res.render("Login")}     
          }   */

        if(req.body.password == "hola" && req.body.email == "2fede14@gmail.com"){
            req.session.usuario = "logueado"
            next();
        } else {res.render("Login")}    
        
        console.log(req.body.recuerdame);
        

        if(req.body.recuerdame == on){
            res.cookie('fede', '123', {maxAge: 3600000})
        } else {
            next()
        }
          
    },
    auth: function(req, res, next){
        if(req.session.usuario != undefined){
            next()
        } else {
            res.redirect("/users/login")
        }
    }
}

module.exports = middleware