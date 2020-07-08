module.exports = (sequelize, dataType) => {

    alias = 'Cart',

    cols = {
        order_date: dataType.DATE,
        order_adress: dataType.STRING,
        order_satus: dataType.STRING,
        total: dataType.INTEGER,
    }

    config = {
        tablename: 'users',
        timestamps: false
    }

    var Cart = sequelize.define(alias, cols, config)

    Cart.associate = function(models){
        Cart.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'fk_user_id'
        })
        Cart.belongsTo(models.Cart_details, {
            as: 'cart_detail',
            foreignKey: 'cart_details_id'
        })
    }

    return Cart
}