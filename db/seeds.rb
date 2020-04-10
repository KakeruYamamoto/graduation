# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# アドミンユーザ生成
User.create!(name: 'admin',
             email: 'admin@gmail.com',
             password: 'admin@gmail.com',
             password_confirmation: 'admin@gmail.com',
             admin: true)

# ユーザ生成
30.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'password'
  User.create!(name: name,
               email: email,
               icon: open("#{Rails.root}/db/fixtures_icon/images (#{rand(1..43)}).jpeg"),
               password: password,
               password_confirmation: password)
end

# イベントを持たせるユーザ生成
email1 = Faker::Internet.email
email2 = Faker::Internet.email
password = 'password'
test_user1 = User.create(name: 'test_user1',
                         email: email1,
                         icon: open("#{Rails.root}/db/fixtures_icon/images (#{rand(1..43)}).jpeg"),
                         password: password,
                         password_confirmation: password)

test_user2 = User.create(name: 'test_user2',
                         email: email2,
                         icon: open("#{Rails.root}/db/fixtures_icon/images (#{rand(1..43)}).jpeg"),
                         password: password,
                         password_confirmation: password)

# ユーザイベント１
num = 0
10.times do |n|
  num += 1
  title = Faker::Game.title
  I18n.locale = 'ja'
  address = Gimei.address
  time = Time.new
  @tommorrow_time = time + (60 * 60 * 24 * 1)
  content = Faker::ChuckNorris.fact
  events1 = test_user1.events.build(
    title: title,
    content: content,
    image: open("#{Rails.root}/db/fixtures/img#{rand(1..16)}.jpg"),
    e_date_start: @tommorrow_time,
    e_date_end: @tommorrow_time,
    address: address.kanji
  )
  events1.save
end

# ユーザイベント２
10.times do |n|
  num += 1
  title = Faker::Game.title
  I18n.locale = 'ja'
  address = Gimei.address
  content = Faker::ChuckNorris.fact
  events2 = test_user2.events.build(
    title: title,
    content: content,
    image: open("#{Rails.root}/db/fixtures/img#{rand(1..16)}.jpg"),
    e_date_start: @tommorrow_time,
    e_date_end: @tommorrow_time,
    address: address.kanji
  )
  events2.save
end

# テストユーザ３

test_user3 = User.create(name: '田中太郎',
                         email: 'tanaka@mail.com',
                         icon: open("#{Rails.root}/db/fixtures_icon/images (#{rand(1..43)}).jpeg"),
                         password: 'tanaka@mail.com',
                         password_confirmation: 'tanaka@mail.com')

# ユーザイベント3
10.times do |n|
  num += 1
  title = Faker::Game.title
  address = Gimei.address
  time = Time.new
  @date_time = time + (60 * 60 * 24 * 30)
  content = Faker::ChuckNorris.fact
  events3 = test_user3.events.build(
    title: title,
    content: content,
    image: open("#{Rails.root}/db/fixtures/img#{rand(1..16)}.jpg"),
    e_date_start: @date_time,
    e_date_end: @date_time,
    address: address.kanji
  )
  events3.save
end

# ラベル
Label.create!(name: '屋内')
Label.create!(name: '屋外')
Label.create!(name: '春限定')
Label.create!(name: '夏限定')
Label.create!(name: '秋限定')
Label.create!(name: '冬限定')
