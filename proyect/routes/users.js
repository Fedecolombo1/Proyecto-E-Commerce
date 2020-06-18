var express = require('express');
var router = express.Router();
const usersMiddleware = require("../middlewares/usersMiddleware")

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
router.get('/register', usersMiddleware.guest,function(req, res, next) {
  res.render('Register');
});
module.exports = router;
