var express = require('express');
var router = express.Router();
var homeController = require("../controllers/homeController");
var userMiddleware = require('../middlewares/usersMiddleware');
const bcrypt = require("bcrypt-nodejs");

/* GET home page. */
router.get('/',homeController.home);
router.get('/:category_id', homeController.list);


module.exports = router;
