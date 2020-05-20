var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});
router.get('/detail', function(req, res, next) {
  res.render('productDetail');
});
router.get('/add', function(req, res, next) {
  res.render('productAdd');
});
router.get('/cart', function(req, res, next) {
  res.render('productCart');
});

module.exports = router;
