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
        if(product == undefined){
            res.render("error")
        }
        res.render('productDetail',{product});
    },
    delete: function(req, res, next) {
        console.log(products);
        products = products.filter(product => product.id != req.params.id)

        products = JSON.stringify(products);
        fs.writeFileSync("./database/products.json", products);
        
        res.render("home")   
    }
}

module.exports = controller