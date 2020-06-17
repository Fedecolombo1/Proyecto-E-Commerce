var express = require('express');
var router = express.Router();
var homeController = require("../controllers/homeController")
var userMiddleware = require('../middlewares/usersMiddleware')

/* GET home page. */
router.get('/',homeController.home);
router.get('/:category', homeController.list);


module.exports = router;
