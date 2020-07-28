const fs = require('fs');
const path = require('path');
const {check, validationResult, body} = require('express-validator');
const db = require('../database/models/');
const { ifError } = require('assert');

var products = JSON.parse(fs.readFileSync("./database/products.json", {encoding: 'utf-8'}))

var products96 = products.filter(product => product.category == "96");
var productsESSENCE = products.filter(product => product.category == "ESSENCE");
var productsBASIC = products.filter(product => product.category == "BASIC");

var controller = {
    /*productDetail: function(req, res, next) {
        for(var i = 0;i < products.length; i++){
            if(products[i].id == req.params.id){
                var product = products[i]
            }
        }
        if(product == undefined){
            res.render("error")
        }
        var log = 0
        if(req.session.logueado != undefined){
            log = 1
        }
        res.render('productDetail',{product, products, log});
    },*/
    
    productDetail: function(req, res, next){
    db.Product.findByPk(req.params.id,{include: ["images"]})
    .then(function(product){
        console.log(product)
        db.Product.findAll({include: ["images"]})
        .then(function(products){
            var log = 0
            if(req.session.logueado != undefined){
                log = 1
            }
            res.render("productDetail",{product, products, log})
        })
    })
},
    


    /* delete: function(req, res, next) {
        console.log(products);
        products = products.filter(product => product.id != req.params.id)

        products = JSON.stringify(products);
        fs.writeFileSync("./database/products.json", products);
        
        res.render("home")   
    }, */
     
    delete: function(req, res, next){
        db.Product.destroy({
            where: {
                id: req.params.id
            }
        })
        res.redirect('/')
    },
    


    /*edit: function(req,res, next) {
        for(var i = 0;i < products.length; i++){
            if(products[i].id == req.params.id){
                var product = products[i]
            }
        }
        res.render("productEdit", {product})
    },*/
     
    edit: function(req, res, next){
        db.Product.findByPk(req.params.id)
        .then(function(product){
            res.render('productEdit',{product})
        })
    },
    


    /*update: function(req,res, next) {
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
    },*/
    
    update: function(req, res, next){
        var error = validationResult(req)
        var body = req.body

        if(error.isEmpty()){
        db.Product.update(req.body,{
            where: {
                id: req.params.id
            }
        })
        .then(result => {
            res.redirect('/')
        })
    } else {
        res.render('edit/:id', {errors:errors.errors, body})
       }
    },
    

    productAdd: function(req, res, next) {
        res.render('productAdd')
    },

    /*productCreate: function(req,res,next){

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
    },*/
    
    productCreate: function(req, res, next){
        var errors = validationResult(req)
        var body = req.body
        console.log(req.files[0].filename);
        if(errors.isEmpty()){
            db.Product.create(req.body)
            .then(function(product){
                db.Images_product.create({
                    ruta: "/images/products/" + req.files[0].filename,
                    product_id: product.id
                })
                db.Images_product.create({
                    ruta: "/images/products/" + req.files[1].filename,
                    product_id: product.id
                })
            })
            res.redirect('/')
        } else {
            res.render('productAdd', {errors:errors.errors, body})
        }
    },
    cart: function(req, res, next){
        console.log(req.body);
        //recibimos el id del producto del form
        var productId = req.body.productId
        console.log(productId);
        //tenemos de la session el id del usuario
        var userId = req.session.logueado.user_id
        console.log(userId);
        //tomamos el talle
        var talle = req.body.size
        console.log(talle);
        //puede tener muchos carritos (muchos cerrados y uno abierto)
        //si no lo tiene lo creamos sino tomamos el id
        db.Cart.findOne({
            where:  {user_id: userId,
                     order_status: "open"
                    }
        })
        .then(function(carrito){
            if(carrito){
                var cartId = carrito.cart_id
                    db.Product.findByPk(productId)
                    .then(product => {
                        db.Cart_details.create({
                            quantity: 1,
                            size: talle,
                            price: product.price,
                            product_id: product.id,
                            cart_id: cartId
                        })
                        res.redirect("/products/cart")
                    })
            } else {
                db.Cart.create({
                    order_date: Date.now,
                    order_adress: "",
                    order_status: "open",
                    total: 0,
                    user_id: userId
                })
                .then(cart => {
                    var cartIdd = cart.cart_id
                    db.Product.findByPk(productId)
                    .then(product => {
                        db.Cart_details.create({
                            quantity: 1,
                            price: product.price,
                            product_id: product.id,
                            cart_id: cartIdd,
                            size: talle
                        })
                        res.redirect("/products/cart")
                    })
                })
            }
            
            /*carritos.forEach(carrito => {
                if(carrito.id == userId && carrito.order_status == "open"){

                } else {
                    db.Cart.create({
                        order_date: Date.now,
                        order_adress: "",
                        order_status: "open",
                        total: 0,
                        user_id: userId
                    })
                    .then(cart => {
                        
                    })
                }
            })*/
        })
    },
    cartDetail: function(req, res, next) {
        //busco si hay algun carrito abierto
        var userId = req.session.logueado.user_id
        db.Cart.findOne({
            where:  {user_id: userId,
                     order_status: "open"
                    }
        })
        .then(cart => {
            if(cart){
                var cartId = cart.cart_id
                db.Cart_details.findAll({
                    where: {cart_id: cartId},
                    include:[{ all: true, nested: true }]
    
                })
                .then(cartDetails => {
                    //console.log(cartDetails);
                    res.render("productCart",{cartDetails})
                })
            } else {
                res.render("carritoVacio")
            }
        })
    },
    confirm: function(req, res, next){
        var userId = req.session.logueado.user_id
        db.Cart.update({
            order_status: "closed"
        },{
            where:  {user_id: userId,
                order_status: "open"
               }
        }
        )
        .then(function(carrito){

        })
        res.render("confirm")
    },
    removeProduct: function(req, res, next){
        //tome el id del producto
        var productId = req.params.id
        //tome el id del carrito
        var cartId = req.body.cartId
        console.log(productId);
        console.log(cartId);
        db.Cart_details.destroy({
            where: {
                id: cartId
            }
        })
        .then(function(){
            res.redirect("/products/cart")
        })

    }



}

module.exports = controller