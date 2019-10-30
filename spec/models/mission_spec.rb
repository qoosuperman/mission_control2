require 'rails_helper'

RSpec.describe Mission, type: :model do
  describe "可以正常建立任務" do
    context "when 做出正常的任務是有效的" do
      let(:build_mission) { build(:mission) }
      
      specify { expect(build_mission).to be_valid }
    end
  end

  describe "任務必須有名字 / priority / category / start_time" do
    let(:build_mission) { build(:mission, { key => nil }) }
    
    context "when 做出沒名字的 mission 是無效的" do
      let(:key) { :title }
      
      specify { expect(build_mission).not_to be_valid }
    end

    context "when 做出沒 priority 的 mission 是無效的" do
      let(:key) { :priority }
      
      specify { expect(build_mission).not_to be_valid }
    end

    context "when 做出沒 category 的 mission 是無效的" do
      let(:key) { :category }

      specify { expect(build_mission).not_to be_valid }
    end

    context "when 做出沒 start_time 的 mission 是無效的" do
      let(:key) { :start_time }
      
      specify { expect(build_mission).not_to be_valid }
    end
  end
end
