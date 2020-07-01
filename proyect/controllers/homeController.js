const fs = require('fs');
const path = require('path');

var products = JSON.parse(fs.readFileSync("./database/products.json"))

var products96 = products.filter(product => product.category == "96");
var productsESSENCE = products.filter(product => product.category == "ESSENCE");
var productsBASIC = products.filter(product => product.category == "BASIC");

var controller = {
    home: function(req, res, next) {
        res.render('home', {products96, productsESSENCE, productsBASIC});
      },
    list: function(req, res, next) {
      var productsFil = products.filter(product => product.category == req.params.category);
      for(var i = 0;i < products.length; i++){
        if(products[i].category == req.params.category){
            var product = products[i]
        }
      }
      var imageSrc = ''
      if(req.params.category == 'ESSENCE'){
        imageSrc = '/images/banners/essence.jpeg'
      } else if(req.params.category == '96'){
        imageSrc = '/images/banners/96.jpeg'
      } else if(req.params.category == 'BASIC'){
        imageSrc = '/images/banners/basic.jpeg'
      }
      
      
      res.render('listProducts', {products96, productsESSENCE, productsBASIC,product, productsFil, imageSrc});
    }
}

module.exports = controller