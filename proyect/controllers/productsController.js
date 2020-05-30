const fs = require('fs');
const path = require('path');

var products = JSON.parse(fs.readFileSync("./database/products.json"))

var products96 = products.filter(product => product.category == "96");
var productsESSENCE = products.filter(product => product.category == "ESSENCE");
var productsBASIC = products.filter(product => product.category == "BASIC");

var controller = {
    productDetail: function(req, res, next) {
        for(var i = 0;i < products.length; i++){
            if(products[i].id == req.params.id){
                var product = products[i]
            }
        }
        res.render('productDetail',{product});
    }
}

module.exports = controller