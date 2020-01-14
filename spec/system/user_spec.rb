require 'rails_helper'

RSpec.describe "ユーザ管理機能", type: :system do
  before do

    @user1 = FactoryBot.create(:first_user)
    @user2 = FactoryBot.create(:second_user)
    @user3 = FactoryBot.create(:third_user)

    @event1 = FactoryBot.create(:event, user_id: @user1.id)
    @event2 = FactoryBot.create(:second_event, user_id: @user1.id)
    @event3 = FactoryBot.create(:third_event, user_id: @user1.id)
  end

  before(:each) do
    visit new_user_session_path
    fill_in 'user[email]', with: @user1.email
    fill_in 'user[password]', with: @user1.password
    click_on "Log in"
  end


  scenario 'ユーザ一覧のテスト' do
    visit rails_admin_path
    first(:link, "ユーザー").click
    expect(page).to have_content 'test_user1'
    expect(page).to have_content 'test_user2'
    expect(page).to have_content 'test_user3'
  end

  scenario 'ユーザ作成のテスト' do
    visit user_path(@user1)
    click_on "ログアウト"
    visit new_user_registration_path
    fill_in "user[name]", with: 'test_user1_newnewnew'
    fill_in "user[email]", with: 'test_user1_newnewnew@gmail.com'
    fill_in "user[password]", with: 'test_user1_newnewnew@gmail.comtest_user1_newnewnew@gmail.comtest_user1_newnewnew@gmail.com'
    fill_in "user[password_confirmation]", with: 'test_user1_newnewnew@gmail.comtest_user1_newnewnew@gmail.comtest_user1_newnewnew@gmail.com'
    click_on 'Sign up'
    expect(page).to have_content 'アカウント登録が完了しました。'
  end


  scenario "ユーザ更新テスト" do
    visit edit_user_registration_path(@user1)
    fill_in "user[email]", with: 'test_user1_chage_chage_chage@gmail.com'
    fill_in "user[password]", with: 'test_user1@gmail.comtest_user1@gmail.com_chage_chage_chage'
    fill_in "user[password_confirmation]", with: 'test_user1@gmail.comtest_user1@gmail.com_chage_chage_chage'
    fill_in "user[current_password]", with: @user1.password
    click_on 'Update'
    expect(page).to have_text "test_user1_chage_chage_chage@gmail.com"
  end

end
