module.exports = (sequelize, dataType) => {

    alias = 'Cart_details',

    cols = {
        quantity: dataType.INTEGER,
        price: dataType.INTEGER,
        product_id: dataType.INTEGER,
        cart_id: dataType.INTEGER,
    }

    config = {
        tablename: 'cart_details',
        timestamps: false
    }

    var Cart_details = sequelize.define(alias, cols, config)

    Cart_details.associate = function(models){
        
    }

    return Cart_details
}