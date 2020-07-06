module.exports = (sequelize, dataType) => {

    alias = 'Cart_details',

    cols = {
        quantity: dataType.INT,
        price: dataType.INT,
        product_id: dataType.INT,
        cart_id: dataType.INT,
    }

    config = {
        tablename: 'cart_details',
        timestamps: false
    }

    var Cart_details = sequelize.define(alias, cols, config)

    Cart_details.associate = function(models){
        Cart_details.hasMany(models.Cart, {
            as: 'cart',
            foreignKey: 'fk_cart_id'
        })
        Cart_details.belongsTo(models.Product, {
            as: 'product',
            foreignKey: 'fk_product_id'
        })
    }

    return Cart_details
}