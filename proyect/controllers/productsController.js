const fs = require('fs');
const path = require('path');

var products = JSON.parse(fs.readFileSync("./database/products.json", {encoding: 'utf-8'}))

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
        res.render('productDetail',{product, products});
    },
    delete: function(req, res, next) {
        console.log(products);
        products = products.filter(product => product.id != req.params.id)

        products = JSON.stringify(products);
        fs.writeFileSync("./database/products.json", products);
        
        res.render("home")   
    },
    edit: function(req,res, next) {
        for(var i = 0;i < products.length; i++){
            if(products[i].id == req.params.id){
                var product = products[i]
            }
        }
        res.render("productEdit", {product})
    },

    update: function(req,res, next) {
        var updateProduct = {
            id: 1,
            name: req.body.name,
            price:req.body.price,
            img: "/images/products/" + req.body.img,
            imgBack: "/images/products/" + req.body.imgBack,
            category: req.body.category,
        }

        for(var i = 0;i < products.length; i++){
            if(products[i].id == updateProduct.id){
                products[i] = updateProduct
            }
        }
        
        products = JSON.stringify(products);
        fs.writeFileSync("./database/products.json", products);
        
        res.render("home")
    },

    productCreate: function(req,res,next){
        var newProduct = {
            id: 8,
            name: req.body.name,
            price:req.body.price,
            img: "/images/products/" + req.body.img,
            imgBack: "/images/products/" + req.body.imgBack,
            category: req.body.category,
            article: req.body.article,
        }

        products.push(newProduct);
        
        products = JSON.stringify(products);
        fs.writeFileSync("./database/products.json", products);
        res.render("home")
    },

}

module.exports = controller