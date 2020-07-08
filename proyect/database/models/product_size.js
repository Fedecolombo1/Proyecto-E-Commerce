module.exports = (sequelize, dataType) => {

    alias = 'Product_size',

    cols = {
        product_id: dataType.INTEGER,
        size_id: dataType.INTEGER
    }

    config = {
        tablename: 'product_size',
        timestamps: false
    }

    var Product_size = sequelize.define(alias, cols, config)

    Product_size.associate = function(models){
        Product_size.belongsTo(models.Product, {
            as: 'products',
            foreignKey: 'fk_psize_id'
        })
        Product_size.belongsTo(models.Size, {
            as: 'sizes',
            foreignKey: 'fk_order_size_id'
        })
    }

    return Product_size
}