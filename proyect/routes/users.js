var express = require('express');
var router = express.Router();
const usersMiddleware = require("../middlewares/usersMiddleware")
var multer = require('multer');
var upload = multer({dest: '../public/images/users'});

var imageStorage = multer.diskStorage({
  destination: function(req,res, cb){
    cb(null, 'public/images/users')
  },
  filename: function(req,res, cb){
    cb(null, file.fieldname + '' + Date.now() + path.extname(file.originalname))
  }
});

var upload = multer({ storage: storage });

/* GET users listing. */

router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/login',function(req, res, next) {
  res.render('Login');
});

router.post('/login', usersMiddleware.login,function(req, res, next) {
  res.render('Home');
});

router.get('/register', usersController.registerRender);

router.post('/register', upload.any(), [
  check('name').isLength({min: 1}).withMessage('Completa su nombre por favor'), check('lastname').isLength({ min: 2 }).withMessage('Completa su apellido por favor'),
  check('email').isEmail().withMessage('Email invalido'),
  check('password').isLength({min: 8}).withMessage('La contraseña debe tener al menos 8 caracteres'), check('phoneNumber').isInt().withMessage('Ingresar su numero de telefono'),
  check('phoneNumber').isLength({ min: 8 }).withMessage('El numero de telefono debe tener 8 caracteres'),


body('passwordConfirm').custom(function (value, {req}) {
  let passwordTest = req.body.password;
  console.log(passwordTest);
  if (passwordTest != value) {
      return false
  }
  return true;
}).withMessage('No coinciden las contraseñas')


], usersController.storeRegisterForm);



module.exports = router;
