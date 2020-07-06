module.exports = (sequelize, dataType) => {

    alias = 'Size',

    cols = {
        talle: dataType.STRING
    }

    config = {
        tablename: 'sizes',
        timestamps: false
    }

    var Size = sequelize.define(alias, cols, config)

    Size.associate = function(models){
        Size.belongsToMany(models.Product, {
            as: 'products',
            through: 'product_size',
            foreignKey: 'size_id',
            other_id: 'product_id',
            timestamps: false
        })
        Size.belongsTo(models.product_size, {
            as: 'product_size',
            foreignKey: 'product_size_id'
        })
    }

    return Size
}