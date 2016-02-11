# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new
u.email = 'admin@admina.com'
u.password = 'password'
u.username = 'micco'
u.save!

u = User.new
u.email = 'user1@admin.com'
u.password = 'password'
u.username = 'romel'
u.save!

u = User.new
u.email = 'user2@admin.com'
u.password = 'password'
u.username = 'martin'
u.save!