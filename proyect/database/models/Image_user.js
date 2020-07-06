module.exports = (sequelize, dataType) => {

    alias = 'Image_user',

    cols = {
        avatar: dataType.VARCHAR,
    }

    config = {
        tablename: 'image_users',
        timestamps: false
    }

    var Image_user = sequelize.define(alias, cols, config)
        Image_user.belongsTo(models.User, {
            as: 'user',
            foreignKey: 'user_id'
        })

    return Image_user
}