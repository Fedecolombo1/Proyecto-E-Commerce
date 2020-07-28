const bcrypt = require("bcryptjs");
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
                if(bcrypt.compareSync(req.body.password, user.password) == true){
                    console.log(user);
                    req.session.logueado = user
                    //console.log(userFound);
                    userFound = user
                    if(req.body.recuerdame != undefined){
                    res.cookie('recuerdame', userFound.email, {maxAge: 36000000})
                    }
                    next()
                } else {
                //si no encontro
                    userFound = ""
                    error = "El email o la contraseña no coinciden"
                    res.render('login', {errors:errors.errors, error})
                } 
            } else {
                //si no encontro
                res.render('login', {errors:errors.errors})
            }         
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
    admin: function(req,res,next){
        console.log(req.session.logueado);
        if(req.session.logueado.user_id == 2 || req.session.logueado.user_id == 27){
            next();
        }else{
            res.render("sinPermisos");
        }
    },
    recuerdame: function(req, res, next){
        console.log(req.cookie.recuerdame);
        if(req.cookie.recuerdame){
            db.User.findOne({
                where: {
                    email: req.cookie.recuerdame.email
                }
            })
            .then(function(user){
                if(user){
                    req.session.logueado = user
                }
            })
            next()
        }
        next()
 }
}
module.exports = middleware