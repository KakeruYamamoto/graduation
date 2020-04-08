# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    @user1 = FactoryBot.create(:first_user)
    @event1 = FactoryBot.create(:event, user_id: @user1.id)
  end

  it 'titleが空ならバリデーションが通らない' do
    contact = Contact.new(title: '', email: 'seikou@gmail.com', content: '失敗テスト', event_id: @event1.id)
    expect(contact).not_to be_valid
  end

  it 'emailが空ならバリデーションが通らない' do
    contact = Contact.new(title: '失敗テスト', email: '', content: '', event_id: @event1.id)
    expect(contact).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    contact = Contact.new(title: '失敗テスト', email: 'seikou@gmail.com', content: '', event_id: @event1.id)
    expect(contact).not_to be_valid
  end

  it 'titleとemailとcontentに内容が記載されていればバリデーションが通る' do
    contact = Contact.new(title: '成功テスト', email: 'seikou@gmail.com', content: '成功テスト', event_id: @event1.id)
    expect(contact).to be_invalid
  end
end
