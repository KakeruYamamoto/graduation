# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#アドミンユーザ生成
# User.create!(name: "admin",
#             email: "admin@gmail.com",
#             password: "admin@gmail.com",
#             password_confirmation: "admin@gmail.com",
#             admin: true
#             )


# ユーザ生成
  30.times do |n|
    name = Faker::Name.name
    email = Faker::Internet.email
    password = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password,
                 )

  end


#イベントを持たせるユーザ生成
  email1 = Faker::Internet.email
  email2 = Faker::Internet.email
  password = "password"
  test_user1 = User.create(name: "test_user1",
              email: email1,
              password: password,
              password_confirmation: password,
              )

  test_user2 = User.create(name: "test_user2",
              email: email2,
              password: password,
              password_confirmation: password,
              )


  num = 0
  10.times do |n|
    num += 1
    title = Faker::Game.title
    I18n.locale = 'ja'
    time = Time.new
    # time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
    # s1 = Date.parse("2019/01/01")
    # s2 = Date.parse("2021/01/01")
    # s = Random.rand(s1 .. s2)
    address = Gimei.address

    events1 = test_user1.events.build(
                        title: title,
                        content: "test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}",
                        e_date_start: time,
                        e_date_end: time,
                        address: address.kanji
                        )
    events1.save
  end

  10.times do |n|
    num += 1
    title = Faker::Game.title
    I18n.locale = 'ja'
    time = Time.new
    # time  = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short)
    # s1 = Date.parse("2019/01/01")
    # s2 = Date.parse("2021/01/01")
    # s = Random.rand(s1 .. s2)
    address = Gimei.address

    events2 = test_user2.events.build(
                        title: title,
                        content: "test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}",
                        e_date_start: time,
                        e_date_end: time,
                        address: address.kanji
                        )
    events2.save
  end

  Label.create!(name: "屋内")
  Label.create!(name: "屋外")
  Label.create!(name: "春限定")
  Label.create!(name: "夏限定")
  Label.create!(name: "秋限定")
  Label.create!(name: "冬限定")
