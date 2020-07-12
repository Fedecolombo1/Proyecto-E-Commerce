module.exports = (sequelize, dataType) => {

    alias = 'Images_product',

    cols = {
        ruta: dataType.STRING,
        product_id: dataType.INTEGER
    }

    config = {
        tablename: 'images_products',
        timestamps: false
    }

    var Images_product = sequelize.define(alias, cols, config)

    Images_product.associate = function(models){
            Images_product.belongsTo(models.Product, {
                as: 'product',
                foreignKey: 'product_id'
            })
        }
    return Images_product
}