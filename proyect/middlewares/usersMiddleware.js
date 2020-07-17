const bcrypt = require("bcrypt-nodejs");
const fs = require("fs");
const { validationResult } = require("express-validator");

var users = JSON.parse(fs.readFileSync("./database/users.json"));

var middleware = {

    login: function(req, res, next){
        var errors = validationResult(req)
        var userFound = '';
            
        userFound = users.filter(function (user) {
            return user.email == req.body.email &&
            bcrypt.compareSync(req.body.password, user.password)            
        });
        
        if(userFound != ''){
            req.session.logueado = userFound
            //console.log(userFound);
            
            if(req.body.recuerdame != undefined){
                res.cookie('recuerdame', userFound[0].email, {maxAge: 36000000})
            }
            
            
            res.render('home')
        } else {
            res.render('login', {errors:errors.errors})
        }

        

        console.log(req.session.logueado);
        
          
    },
    
    auth: function(req, res, next){
        if(req.session.logueado != undefined){
            next()
        } else {
            res.redirect("/users/login")
        }
    },

    guest: function(req,res,next){
        if(!req.session.logueado){
            next();
        }else{
            res.redirect('/')
        }
    },
    admin: function(){
        if(req.session.user.name == "Isa"){
            next();
        }else{
            res.redirect("/");
        }
    },
    recuerdame: function(req, res, next){
        console.log(req.cookie.recuerdame);
        
        var users = JSON.parse(fs.readFileSync("./database/users.json", {encoding: 'utf-8'}))
        if(req.cookie.recuerdame != undefined && req.session.logueado == undefined){
            for(var i=0; i= users.length; i++){
                if(users[i].email == req.cookie.recuerdame){
                    userLog = users[i]
                    break;
                    
                }
            }
            req.session.logueado = userLog
        }


 }
}
module.exports = middleware