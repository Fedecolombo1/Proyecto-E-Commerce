var express = require('express');
var router = express.Router();
var productsController = require("../controllers/productsController")

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});
router.get('/detail/:id', productsController.productDetail);
router.get('/add', function(req, res, next) {
  res.render('productAdd');
});
router.get('/cart', function(req, res, next) {
  res.render('productCart');
});

module.exports = router;
