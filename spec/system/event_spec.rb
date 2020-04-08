# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'イベント管理機能', type: :system do
  before do
    @user1 = FactoryBot.create(:first_user)

    @event1 = FactoryBot.create(:event, user_id: @user1.id)
    @event2 = FactoryBot.create(:second_event, user_id: @user1.id)
    @event3 = FactoryBot.create(:third_event, user_id: @user1.id)
    @label1 = FactoryBot.create(:label_one)
    @label2 = FactoryBot.create(:label_two)
    @label3 = FactoryBot.create(:label_tree)
  end

  before(:each) do
    visit new_user_session_path
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_on 'サインイン'
  end

  scenario 'イベント一覧のテスト' do
    visit events_path
    expect(page).to have_content 'test_event_01'
  end

  scenario 'イベント作成のテスト' do
    visit new_event_path
    fill_in 'event[title]', with: 'eventsample'
    fill_in 'event[address]', with: '東京'

    select '2021', from: 'event[e_date_start(1i)]'
    select '1月', from: 'event[e_date_start(2i)]'
    select '1', from: 'event[e_date_start(3i)]'
    select '12', from: 'event[e_date_start(4i)]'
    select '00', from: 'event[e_date_start(5i)]'

    select '2021', from: 'event[e_date_end(1i)]'
    select '1月', from: 'event[e_date_end(2i)]'
    select '1', from: 'event[e_date_end(3i)]'
    select '13', from: 'event[e_date_end(4i)]'
    select '00', from: 'event[e_date_end(5i)]'

    fill_in 'event[content]', with: 'eventtesteventtesteventtest'
    click_on '登録する'
    expect(page).to have_content 'eventtesteventtesteventtest'
    expect(page).to have_content 'eventsample'
  end

  scenario 'イベント詳細のテスト' do
    visit events_path(@event1.id)
    expect(page).to have_content 'test_event_01'
  end

  scenario 'イベント更新テスト' do
    visit event_path(@event2.id)
    click_on '編集'
    fill_in 'event[title]', with: 'eventsample22'
    fill_in 'event[address]', with: '東京'
    select '2021', from: 'event[e_date_start(1i)]'
    select '1月', from: 'event[e_date_start(2i)]'
    select '1', from: 'event[e_date_start(3i)]'
    select '12', from: 'event[e_date_start(4i)]'
    select '00', from: 'event[e_date_start(5i)]'

    select '2021', from: 'event[e_date_end(1i)]'
    select '1月', from: 'event[e_date_end(2i)]'
    select '1', from: 'event[e_date_end(3i)]'
    select '14', from: 'event[e_date_end(4i)]'
    select '00', from: 'event[e_date_end(5i)]'

    fill_in 'event[content]', with: 'eventtesteventtesteventtest22'
    click_on '登録する'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content 'eventtesteventtesteventtest22'
    expect(page).to have_content 'eventsample22'
  end

  scenario 'イベント削除' do
    visit edit_event_path(@event3)
    click_on 'イベントを中止にする'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_text 'イベントを削除しました！'
    expect(page).not_to have_text 'test_event_03'
  end

  scenario 'イベント検索のテスト' do
    visit events_path
    fill_in 'q[title_or_content_or_address_cont_any]', with: 'test_event_01'

    click_on '検索'
    expect(page).to have_content 'test_event_01'
  end
end
