# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "admin@admin.com",
  password: "naganocake"
)


Customer.create!(
  last_name: "安倍",
  first_name: "晋三",
  last_name_kana: "アベ",
  first_name_kana: "シンゾウ",
  email: "japan@japan.com",
  postcode: "1008914",
  address: "東京都千代田区永田町1-6-1",
  tel: "0120508046",
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
  tel: "0120223399",
  password: "yourefire",
  password_confirmation: "yourefire"
)

Genre.create!(category: "ケーキ")
Genre.create!(category: "バースデーケーキ")
Genre.create!(category: "チョコレート")
Genre.create!(category: "焼き菓子")
Genre.create!(category: "ジャム")

Item.create!(
  name: "ショートケーキ",
  price: "350",
  introduction: "苺のショートケーキです。",
  genre_id: "1",
  item_image: File.open('./app/assets/images/spongecake.jpeg')
)

Item.create!(
  name: "チーズケーキ",
  price: "380",
  introduction: "軽井沢で作られたチーズを使っています。",
  genre_id: "1",
  item_image: File.open('./app/assets/images/cheesecake.jpeg')
)

Item.create!(
  name: "モンブラン",
  price: "400",
  introduction: "ラム酒の利いたモンブランです。",
  genre_id: "1",
  item_image: File.open('./app/assets/images/MontBlanc.jpeg')
)

Item.create!(
  name: "バースデーケーキ(苺)",
  price: "1500",
  introduction: "お祝いに。",
  genre_id: "2",
  item_image: File.open('./app/assets/images/birthdaycake.jpeg')
)

Item.create!(
  name: "バースデーケーキ(チョコ)",
  price: "1500",
  introduction: "チョコレートのバースデーケーキです。",
  genre_id: "2",
  item_image: File.open('./app/assets/images/birthdaycake-choco.jpeg')
)

Item.create!(
  name: "トリュフチョコ",
  price: "150",
  introduction: "美味しいです。",
  genre_id: "3",
  item_image: File.open('./app/assets/images/chocolate-truffle.jpeg')
)

Item.create!(
  name: "フィナンシェ",
  price: "120",
  introduction: "美味しいです。",
  genre_id: "4",
  item_image: File.open('./app/assets/images/Financier.jpeg')
)

Item.create!(
  name: "生チョコ",
  price: "170",
  introduction: "とろけます。",
  genre_id: "3",
  item_image: File.open('./app/assets/images/Ganache.jpeg')
)

Item.create!(
  name: "苺ジャム",
  price: "450",
  introduction: "作っちゃいました!",
  genre_id: "5",
  item_image: File.open('./app/assets/images/jam.jpeg')
)

Item.create!(
  name: "マドレーヌ",
  price: "130",
  introduction: "美味しいと思います。",
  genre_id: "4",
  item_image: File.open('./app/assets/images/madeleine.jpeg')
)

