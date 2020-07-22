const bcrypt = require("bcrypt-nodejs");
const fs = require("fs");
const { validationResult } = require("express-validator");
const db = require('../database/models/')

var userss = JSON.parse(fs.readFileSync("./database/users.json"));

var middleware = {

    login: function(req, res, next){
        var errors = validationResult(req)
        var userFound = '';
        
        db.User.findOne({
            where: {email: req.body.email}
        })
        .then(function(user){
            //comparar si encontro
            if(user){
                console.log(req.body.password);
                console.log(user.password);
                if(bcrypt.compareSync(req.body.password, user.password)){
                    
                    userFound = user
                    req.session.logueado = userFound
                    //console.log(userFound);
                
                    if(req.body.recuerdame != undefined){
                    res.cookie('recuerdame', userFound[0].email, {maxAge: 36000000})
                    next()
                    }
                }
                
            } else {
            //si no encontro
                userFound = ""
                res.render('login', {errors:errors.errors})
            }          
        })
        .catch(function(e){
            console.log(e);
        })
        

        

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