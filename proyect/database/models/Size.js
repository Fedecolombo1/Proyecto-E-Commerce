module.exports = (sequelize, dataType) => {

    alias = 'Size',

    cols = {
        size_selected: dataType.STRING
    }

    config = {
        tablename: 'size',
        timestamps: false,
        freezeTableName: true
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
    }

    return Size
}