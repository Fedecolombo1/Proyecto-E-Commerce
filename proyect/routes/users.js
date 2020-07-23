var express = require('express');
var router = express.Router();
const path = require('path');
const usersMiddleware = require("../middlewares/usersMiddleware")
var multer = require('multer');
const {check, validationResult, body} = require('express-validator');
var usersController = require('../controllers/usersController');


var storage = multer.diskStorage({
  destination: function(req,file, cb){
    cb(null, 'public/images/users')
  },
  filename: function(req,file, cb){
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
  }
  
});

var upload = multer({storage: storage});

/* GET users listing. */

router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/login',usersMiddleware.guest,usersController.loginRender);

router.post('/login', [check('email').isEmail().withMessage('Debes poner un Email'),
  check('password').isLength({min: 1}).withMessage('Debes poner una Contraseña')] ,usersMiddleware.login, function(req, res, next) {
  res.render('home');
});

router.get('/register',usersMiddleware.guest, usersController.registerRender);

router.post('/register', upload.any(),[
  
  check('name').isLength({min: 1}).withMessage('Completa su nombre por favor'), 
  check('last_name').isLength({ min: 2 }).withMessage('Completa su apellido por favor'),
  check('email').isEmail().withMessage('Email invalido'),
  check('password').isLength({min: 8}).withMessage('La contraseña debe tener al menos 8 caracteres'), 
  check('phoneNumber').isInt().withMessage('Ingresar su numero de telefono'),
  check('phoneNumber').isLength({ min: 8 }).withMessage('El numero de telefono debe tener 8 caracteres')
  
], usersController.createUser);


router.post('/logout',usersController.logout);


module.exports = router;
