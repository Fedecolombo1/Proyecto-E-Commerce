module.exports = (sequelize, dataType) => {

    alias = 'Is_admin',

    cols = {
        name: dataType.VARCHAR,
    }

    config = {
        tablename: 'is_admin',
        timestamps: false
    }

    var Is_admin = sequelize.define(alias, cols, config)

    Is_admin.associate = function(models){
        Is_admin.hasMany(models.User, {
            as: 'user',
            foreignKey: 'user_id'
        })
    }

    return Is_admin
}