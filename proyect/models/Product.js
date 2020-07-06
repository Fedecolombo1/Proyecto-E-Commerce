module.exports = (sequelize, dataType) => {

    alias = 'Product',

    cols = {
        name: dataType.STRING,
        category_id: dataType.INT,
        price: dataType.INT,
    }

    config = {
        tablename: 'products',
        timestamps: false
    }

    var Product = sequelize.define(alias, cols, config)

    Product.associate = function(models){
        Product.belongsTo(models.Category, {
            as: 'category',
            foreignKey: 'fk_category_id'
        })
        Product.belongsToMany(models.Size, {
            as: 'size',
            through: 'product_size',
            foreignKey: 'product_id',
            other_id: 'size_id',
            timestamps: false
        })
        Product.hasMany(models.Cart_details, {
            as: 'cart_details',
            foreignKey: 'cart_details_id'
        })
        Product.hasMany(models.Images_product, {
            as: 'images_product',
            foreignKey: 'fk_images_product_id'
        })
        Product.hasMany(models.product_size, {
            as: 'product_size',
            foreignKey: 'product_size_id'
        })
    }

    return Product
}