const fs = require('fs');
const path = require('path');
const { decodeBase64 } = require('bcryptjs');

const db = require('../database/models/')

var products = JSON.parse(fs.readFileSync("./database/products.json"))

var products96 = products.filter(product => product.category == "96");
var productsESSENCE = products.filter(product => product.category == "ESSENCE");
var productsBASIC = products.filter(product => product.category == "BASIC");

var controller = {
    home: function(req, res, next) {
        res.render('home', {products96, productsESSENCE, productsBASIC});
      },
    /* list: function(req, res, next) {
      var productsFil = products.filter(product => product.category == req.params.category);
      for(var i = 0;i < products.length; i++){
        if(products[i].category == req.params.category){
            var product = products[i]
        }
      }
      var imageSrc = ''
      var imageSrc1 = ''
      var imageSrc2 = ''
      if(req.params.category == 'ESSENCE'){
        imageSrc = '/images/banners/ESSENCE.jpg'
      } else if(req.params.category == '96'){
        imageSrc = '/images/banners/ORANGE.jpg'
        imageSrc1 = '/images/banners/BLACK_ORANGE.jpg'
        imageSrc2 = '/images/banners/BLACK.jpg'
      } else if(req.params.category == 'BASIC'){
        imageSrc = '/images/banners/TIENDA.jpg'
        imageSrc1 = '/images/banners/TIENDA_AMARELLO.jpg'
        imageSrc2 = '/images/banners/TIENDA_ROSA.jpg'
      }
      
      
      res.render('listProducts', {products96, productsESSENCE, productsBASIC,product, productsFil, imageSrc, imageSrc1, imageSrc2});
    } */
    list: function(req, res, next) {
      db.Product.findAll({
        where: {
          category_id: req.params.category_id
        },
        include: ["category","images"]
        })

      .then(function(products){    
          db.Category.findByPk(req.params.category_id)
          .then(function(categoria){
          var imageSrc = ''
          var imageSrc1 = ''
          var imageSrc2 = ''
          if(req.params.category_id == '2'){
            imageSrc = '/images/banners/ESSENCE.jpg'
          } else if(req.params.category_id == '1'){
            imageSrc = '/images/banners/ORANGE.jpg'
            imageSrc1 = '/images/banners/BLACK_ORANGE.jpg'
            imageSrc2 = '/images/banners/BLACK.jpg'
          } else if(req.params.category_id == '3'){
            imageSrc = '/images/banners/TIENDA.jpg'
            imageSrc1 = '/images/banners/TIENDA_AMARELLO.jpg'
            imageSrc2 = '/images/banners/TIENDA_ROSA.jpg'
          }
          res.render('listProducts', {imageSrc, imageSrc1, imageSrc2, products, categoria});
          })
      })
      

    }
}

module.exports = controller