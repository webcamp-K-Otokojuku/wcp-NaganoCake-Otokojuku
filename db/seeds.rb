# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
  last_name: "安倍",
  first_name: "晋三",
  last_name_kana: "アベ",
  first_name_kana: "シンゾウ",
  email: "japan@japan.com",
  postcode: "1008914",
  address: "東京都千代田区永田町1-6-1",
  password: "abenomikusu",
  password_confirmation: "abenomikusu"
)

Customer.create!(
  last_name: "Trump",
  first_name: "Donald",
  last_name_kana: "トランプ",
  first_name_kana: "ドナルド",
  email: "america@america.com",
  postcode: "1008914",
  address: "アメリカ合衆国ワシントンDCペンシルベニア大通り1600",
  password: "yourefire",
  password_confirmation: "yourefire"
)