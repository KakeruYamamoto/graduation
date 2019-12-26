# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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

  User.create!(name: "admin",
              email: "admin@gmail.com",
              password: "admin@gmail.com",
              password_confirmation: "admin@gmail.com",
              admin: true
              )

  email = Faker::Internet.email
  password = "password"

  test_user1 = User.create(name: "test_user1",
              email: email,
              password: password,
              password_confirmation: password,
              )

  test_user2 = User.create(name: "test_user2",
              email: email,
              password: password,
              password_confirmation: password,
              )

  num = 0
  10.times do |n|
    num =+ 1
    title = Faker::Game.title
    s1 = Date.parse("2019/01/01")
    s2 = Date.parse("2021/01/01")
    s = Random.rand(s1 .. s2)

    events1 = test_user1.events.build(title: title,
                        content: "test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}",
                        e_date: s
                        )
    events1.save
  end

  10.times do |n|
    num =+ 1
    title = Faker::Game.title
    s1 = Date.parse("2019/01/01")
    s2 = Date.parse("2021/01/01")
    s = Random.rand(s1 .. s2)

    events2 = test_user2.events.build(title: title,
                        content: "test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}test#{num}",
                        e_date: s
                        )
    events2.save
  end
# num = 0
# 5.times do |n|
#
#   Label.create!(name: "ラベル#{num += 1}")
#
# end
