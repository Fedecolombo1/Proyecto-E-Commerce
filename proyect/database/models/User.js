const { data } = require("jquery")

module.exports = (sequelize, dataType) => {

    alias = 'User',

    cols = {
        user_id: {
            type: dataType.INTEGER,
            primaryKey:true,
            autoIncrement:true,
            field: "id"
            },
        name: dataType.STRING,
        last_name: dataType.STRING,
        email: dataType.STRING,
        password: dataType.STRING,
        dateOfBirth: dataType.DATE,
        phoneNumber: dataType.INTEGER,
        is_admin: dataType.INTEGER
    }

    config = {
        tablename: 'users',
        timestamps: false
    }

    var User = sequelize.define(alias, cols, config)

    User.associate = function(models){
        User.hasMany(models.Cart, {
            as: 'cart',
            foreignKey: 'cart_id'
        })
    }

    return User
}