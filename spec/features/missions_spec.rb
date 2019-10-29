require 'rails_helper'

RSpec.feature "Missions", type: :feature do
  let(:last_mission) { Mission.last }
  #目前要先做一個使用者出來給 mission存
  before do
    create(:user)
  end
  
  scenario "首頁任務照建立時間排序" do
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
