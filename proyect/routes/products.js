var express = require('express');
var router = express.Router();
var productsController = require("../controllers/productsController")
const path = require('path');
var multer = require('multer');
const {check, validationResult, body} = require('express-validator');


var storage = multer.diskStorage({
  destination: function(req,file, cb){
    cb(null, 'public/images/products')
  },
  filename: function(req,file, cb){
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
  }
  
});

var upload = multer({storage: storage});


/* GET users listing. */

router.get('/detail/:id', productsController.productDetail);

router.get('/add', function(req, res, next) {
  res.render('productAdd')
});

router.post('/add',upload.any() , productsController.productCreate)

router.get('/edit/:id', productsController.edit)

router.post('/edit/:id', productsController.update)

router.post("/delete/:id", productsController.delete)

router.get('/cart', function(req, res, next) {
  res.render('productCart');
});

module.exports = router;
