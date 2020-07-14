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

router.get('/add', productsController.productAdd);

router.post('/add',upload.any(),[
  check('name').isLength({min: 1}).withMessage('Completa el nombre'), 
  check("price").isLength({min: 1}).withMessage("Completa el precio"),
  check('description').isLength({min: 25}).withMessage('Completa la descropcion, la descripcion debe tener al menos 25 caracters'),
  ] , productsController.productCreate)

router.get('/edit/:id', productsController.edit)

router.post('/edit/:id', upload.any(), [
  check('name').isLength({min: 1}).withMessage('Completa el nombre'), 
  check("price").isLength({min: 1}).withMessage("Completa el precio"),
  check('description').isLength({min: 25}).withMessage('Completa la descropcion, la descripcion debe tener al menos 25 caracters')
] ,productsController.update)

router.post("/delete/:id", productsController.delete)

router.get('/cart', function(req, res, next) {
  res.render('productCart');
});

module.exports = router;
