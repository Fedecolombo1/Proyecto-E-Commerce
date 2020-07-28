var express = require('express');
var router = express.Router();
var productsController = require("../controllers/productsController")
const path = require('path');
var multer = require('multer');
const {check, validationResult, body} = require('express-validator');
const usersMiddleware = require("../middlewares/usersMiddleware")


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

router.get('/add', usersMiddleware.admin, productsController.productAdd);

router.post('/add',upload.any(),[
  check('name').isLength({min: 1}).withMessage('Completa el nombre'), 
  check("price").isLength({min: 1}).withMessage("Completa el precio"),
  ] , productsController.productCreate)

router.get('/edit/:id',usersMiddleware.admin, productsController.edit)

router.post('/edit/:id', upload.any(), [
  check('name').isLength({min: 1}).withMessage('Completa el nombre'), 
  check("price").isLength({min: 1}).withMessage("Completa el precio")
] ,productsController.update)

router.post("/delete/:id",usersMiddleware.admin, productsController.delete)

router.post("/addToCart/:id",usersMiddleware.auth, productsController.cart);

router.post("/removeProduct/:id", productsController.removeProduct);

router.get('/cart',usersMiddleware.auth ,productsController.cartDetail);

router.get("/confirm", productsController.confirm)

module.exports = router;
