module.exports = (sequelize, dataType) => {

    alias = 'Cart',

    cols = {
        cart_id: {
            type: dataType.INTEGER,
            primaryKey:true,
            autoIncrement:true,
            field: "id"
            },
        order_date: dataType.DATE,
        order_address: dataType.STRING,
        order_status: dataType.STRING,
        total: dataType.INTEGER,
    }

    config = {
        tablename: 'cart',
        timestamps: false,
        freezeTableName: true
    }

    var Cart = sequelize.define(alias, cols, config)

    Cart.associate = function(models){
        Cart.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'user_id'
        })
        Cart.belongsToMany(models.Product,{
            as: 'product',
            through: "cart_details",
            foreignKey: "cart_id",
            otherKey: "product_id",
            timestamps: false
        });

    }

    return Cart
}