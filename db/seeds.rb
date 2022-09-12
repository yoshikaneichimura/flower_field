# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.create([
  { area: '北海道'},
  { area: '東北'},
  { area: '信越'},
  { area: '関東'},
  { area: '北陸'},
  { area: '東海'},
  { area: '近畿'},
  { area: '中国'},
  { area: '四国'},
  { area: '九州'},
  { area: '沖縄'},
  ])

admin = Admin.new(:email => 'adminadmin@gmail.com', :password => "qqqqqq")
admin.save!