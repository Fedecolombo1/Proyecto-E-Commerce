module.exports = (sequelize, dataType) => {

    alias = 'Cart_details',

    cols = {
        quantity: dataType.INTEGER,
        price: dataType.INTEGER,
        product_id: dataType.INTEGER,
        cart_id: dataType.INTEGER,
        size: dataType.STRING
    }

    config = {
        tablename: 'cart_details',
        timestamps: false
    }

    var Cart_details = sequelize.define(alias, cols, config)

    Cart_details.associate = function(models){
        Cart_details.belongsTo(models.Product, {
            as: 'product',
            foreignKey: 'product_id'
        })
    }

    return Cart_details
}