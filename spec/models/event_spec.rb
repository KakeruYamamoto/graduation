
require 'rails_helper'

RSpec.describe Event, type: :model do

  before do
    @user1 = FactoryBot.create(:first_user)
  end

  it "titleが空ならバリデーションが通らない" do
    event = Event.new(title: '', content: '失敗テスト',address: '沖縄県那覇市', e_date_start: '2021-12-01 12:03:25', e_date_end: '2021-12-01 13:03:25' , user_id: @user1.id)
    expect(event).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    event = Event.new(title: '失敗テスト', content: '',address: '沖縄県那覇市', e_date_start: '2021-12-01 12:03:25', e_date_end: '2021-12-01 13:03:25' , user_id: @user1.id)
    expect(event).not_to be_valid
  end

  it "全項目に内容が記載されていればバリデーションが通る" do
    event = Event.new(title: '成功テスト', content: '成功テスト',address: '沖縄県那覇市', e_date_start: '2021-12-01 12:03:25', e_date_end: '2021-12-01 13:03:25' , user_id: @user1.id)
    expect(event).to be_invalid
  end
end
