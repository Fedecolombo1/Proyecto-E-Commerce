module.exports = (sequelize, dataType) => {

    alias = 'User',

    cols = {
        name: dataType.STRING,
        last_name: dataType.STRING,
        email: dataType.STRING,
        password: dataType.STRING,
        dateOfBirth: dataType.DATE,
        phoneNumber: dataType.INTEGER
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
        User.belongsTo(models.Image_user, {
            as: "image_user",
            foreignKey: "fk_images_users_id"
        })
        User.belongsTo(models.Is_admin, {
            as: "is_admin",
            foreignKey: "fk_is_admin_id"
        })
    }

    return User
}