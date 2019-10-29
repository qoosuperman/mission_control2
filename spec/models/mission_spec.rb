require 'rails_helper'

RSpec.describe Mission, type: :model do
  context "可以正常建立任務" do
    it "做出正常的任務是有效的" do
      m1 = build(:mission)
      expect(m1.valid?).to be true
    end
  end

  context "任務必須有名字 / priority / category / start_time" do
    after do
      expect(@m1.valid?).to be false
    end

    it "做出沒名字的 mission 是無效的" do
      @m1 = build(:mission, title: nil)
    end

    it "做出沒 priority 的 mission 是無效的" do
      @m1 = build(:mission, priority: nil)
    end

    it "做出沒 category 的 mission 是無效的" do
      @m1 = build(:mission, category: nil)
    end

    it "做出沒 start_time 的 mission 是無效的" do
      @m1 = build(:mission, start_time: nil)
    end
  end
end
