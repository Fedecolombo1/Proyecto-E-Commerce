module.exports = (sequelize, dataType) => {

    alias = 'Product',

    cols = {
        name: dataType.STRING,
        category_id: dataType.INTEGER,
        price: dataType.INTEGER,
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
        Product.belongsToMany(models.Cart,{
            as: 'cart',
            through: "cart_details",
            foreignKey: "product_id",
            otherKey: "cart_id",
            timestamps: false
        });
        Product.belongsToMany(models.Size, {
            as: 'size',
            through: 'product_size',
            foreignKey: 'product_id',
            other_id: 'size_id',
            timestamps: false
        })
        Product.hasMany(models.Images_product, {
            as: 'images',
            foreignKey: 'product_id'
        })
        
    }

    return Product
}