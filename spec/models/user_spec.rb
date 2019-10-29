require 'rails_helper'

RSpec.describe User, type: :model do
  context "使用者必須有名字" do

    it "做出有名字的 user 是有效的" do
      u1 = build(:user)
      expect(u1.valid?).to be true
    end

    it "做出沒名字的 user 是無效的" do
      u1 = build(:user, name: nil)
      expect(u1.valid?).to be false
    end
  end

end
