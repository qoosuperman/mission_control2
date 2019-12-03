require 'rails_helper'

RSpec.feature "Missions", type: :feature do
  let(:last_mission) { Mission.last }
  let(:user) { create(:user, email: "qqq@gmail.com", password: "123456", password_confirmation: "123456") }
  #目前要先做一個使用者出來給 mission存
  
  context "when default，首頁任務照建立時間排序" do
    before do
      create(:mission, title: "M1", user_id: user.id)
      create(:mission, title: "M2", user_id: user.id)
      signin_user
    end

    scenario  do
      visit root_path
      within 'tbody tr:nth-child(1)' do
        expect(page).to have_content("M2")
      end
      within 'tbody tr:nth-child(2)' do
        expect(page).to have_content("M1")
      end
    end
  end
  

  context "when 按下結束時間連結，首頁可以照結束時間排序" do
    before do
      create(:mission, title: "M1", end_time: DateTime.new(2019, 10, 31, 12, 34, 56), user_id: user.id)
      create(:mission, title: "M2", end_time: DateTime.new(2019, 10, 29, 12, 34, 56), user_id: user.id)
      signin_user
    end

    scenario  do
      visit root_path
      click_link "結束時間"
      within 'tbody tr:nth-child(1)' do
        expect(page).to have_content("M1")
      end
      within 'tbody tr:nth-child(2)' do
        expect(page).to have_content("M2")
      end
    end
  end

  context "when 按下優先度連結，首頁可以照優先度排序" do
    before do
      create(:mission, title: "M1", priority: "urgent", user_id: user.id)
      create(:mission, title: "M2", priority: "low", user_id: user.id)
      create(:mission, title: "M3", priority: "common", user_id: user.id)
      signin_user
    end

    scenario  do
      visit root_path
      click_link "優先度"
      within 'tbody tr:nth-child(1)' do
        expect(page).to have_content("M2")
      end
      within 'tbody tr:nth-child(2)' do
        expect(page).to have_content("M3")
      end
      within 'tbody tr:nth-child(3)' do
        expect(page).to have_content("M1")
      end
    end
  end

  context "when 按下查詢可以得到符合條件的任務" do
    before do
      create(:mission, title: "M1", user_id: user.id)
      create(:mission, title: "M2", user_id: user.id)
      create(:mission, title: "G3", status: "handling", user_id: user.id)
      create(:mission, title: "M4", status: "complete", user_id: user.id)
      signin_user
    end

    scenario  do
      visit root_path
      fill_in "q_title_cont", with: "M"
      fill_in "q_status_cont", with: "pen"
      click_button "搜尋"
      within '.table' do
        expect(page).to have_content("M2")
        expect(page).to have_content("M1")
        expect(page).not_to have_content("G3")
        expect(page).not_to have_content("M4")
      end
    end
  end

  context "when 基本功能" do
    before do
      user
      signin_user
    end

    scenario "可以新增任務" do
      visit root_path
      click_link "新增任務"
      fill_in "mission_title", with: "M1"
      click_button "送出"
      expect(page).to have_content("M1")
      expect(last_mission.title).to eq "M1"
    end

    scenario "可以編輯任務" do
      create(:mission, title: "M1", user_id: user.id)
      visit root_path
      click_link "編輯"
      fill_in "mission_title", with: "M2"
      click_button "送出"
      expect(page).to have_content("M2")
      expect(last_mission.title).to eq "M2"
    end
    
    scenario "可以刪除任務", js: true do
      create(:mission, title: "M1", user_id: user.id)
      visit root_path
      click_link "刪除"
      page.driver.browser.switch_to.alert.accept
      expect(page).not_to have_content("M1")
      expect(Mission.count).to be(0)
    end
  end

  private
  def signin_user
    visit signin_path
    fill_in("session[email]", with: "qqq@gmail.com")
    fill_in("session[password]", with: "123456")
    click_button("登入")
  end
  
end
