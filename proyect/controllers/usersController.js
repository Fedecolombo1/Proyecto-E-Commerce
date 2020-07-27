const fs = require('fs');
const path = require('path');
const bcrypt = require("bcryptjs")
const { check, validationResult } = require('express-validator');
const multer = require('multer');

const db = require('../database/models/')


var users = JSON.parse(fs.readFileSync("./database/users.json", {encoding: 'utf-8'}))



var controller = {

// Login
    loginRender: function (req,res, next) {
        res.render('login')
    },

    /* startLogin: function (req,res, next){
        var logueado = 0
        if(req.session.logueado != undefined){
          logueado = 1
        }
        var errors = validationResult(req);
        var usersLogin = '';

        for(var i=0; i= users.length; i++){
            if(users[i].email == req.body.email && bcrypt.compareSync(req.body.password, users[i].password)){
                usersLogin = users[i];
                break;
            }
        }

        if(usersLogin == undefined){
            return res.render('login', {errors: [
                {msg: 'Se produjo un error al iniciar sesión. Verifique el correo electrónico o la contraseña.'}
            ]});
        };

        res.redirect('/')
    }, */
    startLogin: function (req,res, next){
        var logueado = 0
        if(req.session.logueado != undefined){
          logueado = 1
        }
        var errors = validationResult(req);
        var usersLogin = '';
        db.User.findOne({
            where: {
                email: req.body.email,
            }
        })
        .then(function(user){
            if(bcrypt.compareSync(req.body.password, user.password)){
                res.redirect('/')
            } else {
                return res.render('login', {errors});
            }
        }
    )},
// por ahora no existe el log-out botton (es para el futuro)

    logout: function(req, res, next){
        req.session.destroy();
        res.clearCookie('remember')
		res.redirect("/");

    },

//register

    registerRender: function(req, res, next){
        res.render('register')
    },

    
    /* createUser: function (req,res,next) {
        console.log(req.body);
        
    var errors = validationResult(req);
    console.log(errors);
    
    var body = req.body;

    if(!errors.isEmpty()){
    
        res.render('register', {errors: errors.errors, body})
        
    } else{
        var newUser = {
            id:1, 
            name: req.body.name,
            lastname:req.body.lastname,
            email: req.body.email,
            password: bcrypt.hashSync(req.body.password, 10),
            dateOfBirth:req.body.dateOfBirth,
            phoneNumber: req.body.phoneNumber,
            avatar: req.body.avatar
        }
    console.log(req.body)
    
users.push(newUser);
users = JSON.stringify(users);
    fs.writeFileSync("./database/users.json", users);
    res.render("home")
}
}, */
     createUser: function(req, res, next){
        var errors = validationResult(req)
        var body = req.body;
        console.log(req.body);
        if(errors.isEmpty()){
            var userNew = req.body
            userNew.password = bcrypt.hashSync(req.body.password, 10)
            db.User.create(userNew)
            .then(function(userLog){
                console.log(userLog);
                res.redirect('/users/login')
            })
        } else {
            res.render('register', {errors: errors.errors, body})
        }
    }, 

}





module.exports = controller