require 'rails_helper'

RSpec.describe User, type: :model do
  describe "使用者必須有名字" do
    context "when 做出有名字的 user 是有效的" do
      let(:build_user) { build(:user) }

      specify { expect(build_user).to be_valid }
    end

    context "when 做出沒名字的 user 是無效的" do
      let(:build_user) { build(:user, name: nil) }

      specify { expect(build_user).not_to be_valid }
    end
  end
end
