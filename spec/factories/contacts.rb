# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    title { 'MyString' }
    email { 'MyString@gmail.com' }
    content { 'MyText' }
    event_id { 1 }
  end
end
