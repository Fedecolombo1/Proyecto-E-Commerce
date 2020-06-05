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
      
      
      res.render('listProducts', {products96, productsESSENCE, productsBASIC,product, productsFil});
    }
}

module.exports = controller