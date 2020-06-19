const fs = require('fs');
const path = require('path');
const bcrypt = require('bcrypt');
const {check, validationResult, body} = require('express-validator');
const multer = require('multer');

var users = JSON.parse(fs.readFileSync("./database/users.json", {encoding: 'utf-8'}))



var controller = {

// Login
    loginRender: function (req,res, next) {
        res.render('login')
    },

    startLogin: function (req,res, next){
        var errors = validationResult(req);
        var usersLogin;

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
    },

    logout: function(req, res, next){
        req.session.destroy();
        res.clearCookie('remember')
		res.redirect("/");

    },

//register

    registerRender: function(req, res, next){
        res.render('register')
    },

    
    createUser: function (req,res,next) {
        
    
            var newUser = {
                id:1, 
                name: req.body.name,
                lastname:req.body.lastname,
                email: req.body.email,
                password: bcrypt.hashSync(req.body.password, 10),
                dateOfBirth:req.body.dateOfBirth,
                phoneNumber: req.body.phoneNumber,
            }
        console.log(req.body)
        
    users.push(newUser);
    users = JSON.stringify(users);
        fs.writeFileSync("./database/users.json", users);
        res.render("home")

},





}





module.exports = controller