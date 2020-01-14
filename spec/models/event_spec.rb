
require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @user1 = FactoryBot.create(:first_user)
  end
  it "titleが空ならバリデーションが通らない" do
  event = Event.new(title: '', content: '失敗テスト', user_id: @user1.id)
  expect(event).not_to be_valid
end

it "contentが空ならバリデーションが通らない" do
  event = Event.new(title: '失敗テスト', content: '', user_id: @user1.id)
  expect(event).not_to be_valid
end

it "titleとcontentに内容が記載されていればバリデーションが通る" do
  event = Event.new(title: '成功テスト', content: '成功テスト', user_id: @user1.id)
  expect(event).to be_valid
end
end
