module.exports = (sequelize, dataType) => {

    alias = 'Images_product',

    cols = {
        ruta: dataType.VARCHAR,
        product_id: dataType.INT
    }

    config = {
        tablename: 'images_product',
        timestamps: false
    }

    var Images_product = sequelize.define(alias, cols, config)
        Images_product.belongsTo(models.Product, {
            as: 'product',
            foreignKey: 'product_id'
        })

    return Images_product
}