module.exports = (sequelize, dataType) => {

    alias = 'Category',

    cols = {
        name: dataType.STRING,
    }

    config = {
        tablename: 'categories',
        timestamps: false
    }

    var Category = sequelize.define(alias, cols, config)

    Category.associate = function(models){
        Category.hasMany(models.Product, {
            as: 'product',
            foreignKey: 'category_id'
        })
    }

    return Category
}