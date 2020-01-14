require 'rails_helper'

RSpec.describe "タスク管理機能", type: :system do
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
    visit new_session_path
    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password
    click_on "Log in"
  end

  scenario 'タスク一覧のテスト' do
    visit events_path
    expect(page).to have_content 'test_event_01'
  end

  scenario 'タスク作成のテスト' do
    visit new_event_path
    fill_in "タスク名", with: 'event'
    fill_in "タスク詳細", with: 'event'
    click_on '登録する'
    expect(page).to have_content 'event'
  end

  scenario 'タスク詳細のテスト' do
    visit events_path(@event1.id)
    expect(page).to have_content 'test_event_01'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit events_path
    first(:link, "詳細").click
    expect(page).to have_text "test_event_03"
  end

  scenario "終了期限のテスト" do
    visit events_path
    first(:link, "詳細").click
    expect(page).to have_text "2019/11/24"
  end

  scenario "ステータスのテスト" do
    visit events_path
    first(:link, "詳細").click
    expect(page).to have_text "完了"
  end

  scenario "検索ロジックのmodelのテスト" do
    visit events_path
    fill_in "search_event_names", with: 'test_event_03'
    select "完了", from: "event[status]"
    click_on '検索'
    expect(page).to have_content 'test_event_03',"完了"
  end

  scenario "ラベルのテスト" do

    visit events_path

    first(:link, "編集").click
    check 'ラベル１'
    click_on '登録する'
    expect(page).to have_text "ラベル１"
  end

  scenario "ラベル検索のテスト" do
    visit events_path
    select "ラベル１", from: "label_id"
    click_on 'Search'
    expect(page).to have_content "ラベル１"
  end
end
