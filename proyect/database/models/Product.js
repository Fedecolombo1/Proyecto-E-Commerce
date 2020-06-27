module.exports = (sequelize, dataType) => {

    alias = 'Product',

    cols = {
        name: dataType.STRING,
        category: dataType.STRING,
        price: dataType.DECIMAL,
    }

    config = {
        tablename: 'products',
        timestamps: false
    }

    var Product = sequelize.define(alias, cols, config)

    Product.associate = function(models){
        Product.belongsTo(models.Category, {
            as: 'category',
            foreignKey: 'category_id'
        })
    }

    return Product
}