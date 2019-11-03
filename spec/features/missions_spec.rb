require 'rails_helper'

RSpec.feature "Missions", type: :feature do
  let(:last_mission) { Mission.last }
  #目前要先做一個使用者出來給 mission存
  before do
    create(:user)
  end
  
  scenario "when default，首頁任務照建立時間排序" do
    create(:mission, title: "M1")
    create(:mission, title: "M2")
    visit root_path
    within 'tbody tr:nth-child(1)' do
      expect(page).to have_content("M2")
    end
    within 'tbody tr:nth-child(2)' do
      expect(page).to have_content("M1")
    end
  end

  context "when 按下結束時間連結，首頁可以照結束時間排序" do
    before do
      create(:mission, title: "M1", end_time: DateTime.new(2019, 10, 31, 12, 34, 56))
      create(:mission, title: "M2", end_time: DateTime.new(2019, 10, 29, 12, 34, 56))
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

  context "when 按下查詢可以得到符合條件的任務" do
    before do
      create(:mission, title: "M1")
      create(:mission, title: "M2")
      create(:mission, title: "G3", status: "handling")
      create(:mission, title: "M4", status: "complete")
    end

    scenario  do
      visit root_path
      fill_in "q_title_cont", with: "M"
      fill_in "q_status_cont", with: "pen"
      click_button "搜尋"
      expect(page).to have_content("M2")
      expect(page).to have_content("M1")
      expect(page).not_to have_content("G3")
      expect(page).not_to have_content("M4")
    end
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
    create(:mission, title: "M1")
    visit root_path
    click_link "編輯"
    fill_in "mission_title", with: "M2"
    click_button "送出"
    expect(page).to have_content("M2")
    expect(last_mission.title).to eq "M2"
  end
  

  scenario "可以刪除任務", js: true do
    create(:mission, title: "M1")
    visit root_path
    click_link "刪除"
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content("M1")
    expect(Mission.count).to be(0)
  end
  
end
