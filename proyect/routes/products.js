var express = require('express');
var router = express.Router();
var productsController = require("../controllers/productsController")

/* GET users listing. */

router.get('/detail/:id', productsController.productDetail);

router.get('/add', function(req, res, next) {
  res.render('productAdd')
});

router.post('/add', productsController.productCreate)

router.get('/edit/:id', productsController.edit)

router.post('/edit/:id', productsController.update)

router.post("/delete/:id", productsController.delete)

router.get('/cart', function(req, res, next) {
  res.render('productCart');
});

module.exports = router;
