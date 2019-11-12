require 'rails_helper'

RSpec.describe User, type: :model do
  describe "使用者的名字驗證" do
    context "when 做出有名字/email的 user 是有效的" do
      let(:build_user) { build(:user) }

      specify { expect(build_user).to be_valid }
    end

    context "when 做出沒名字的 user 是無效的" do
      let(:build_user) { build(:user, name: nil) }

      specify { expect(build_user).not_to be_valid }
    end

    context "when 做出名字太長的 user 是無效的" do
      let(:build_user) { build(:user, name: "a" * 21) }

      specify { expect(build_user).not_to be_valid }
    end

    context "when 做出名字太短的 user 是無效的" do
      let(:build_user) { build(:user, name: "a") }

      specify { expect(build_user).not_to be_valid }
    end


  end

  describe "使用者的 email 驗證" do
    context "when 做出沒 email 的 user 是無效的" do
      let(:build_user) { build(:user, email: nil) }

      specify { expect(build_user).not_to be_valid }
    end

    context "when email 格式不正確是無效的" do
      let(:build_user) { build(:user) }
      let(:addresses) { %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com] }

      it do
        addresses.each do |invalid_address| 
          build_user.email = invalid_address
          expect(build_user).not_to be_valid
        end
      end
    end

    context "when email 格式正確是有效的" do 
      let(:build_user) { build(:user) }
      let(:addresses) { %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn] }

      it do
        addresses.each do |valid_address|
          build_user.email = valid_address
          expect(build_user).to be_valid
        end
      end
    end 

    context "when email 重複的話無效" do
      let(:user) { create(:user) }

      it do
        user_with_same_email = user.dup
        expect(user_with_same_email).not_to be_valid
      end
    end

    context "when email 大小寫不同還是不能重複" do
      let(:user) { create(:user) }

      it do
        user_with_same_email = user.dup
        user_with_same_email.email = user.email.upcase
        expect(user_with_same_email).not_to be_valid
      end
    end
  end

  describe "使用者的密碼驗證" do
    let(:build_user) { build(:user) }

    context "when 使用者沒有密碼" do
      before { build_user.password = build_user.password_confirmation = " " }
      
      specify { expect(build_user).not_to be_valid }
    end

    context "when password_confirm 不等於 password" do 
      before { build_user.password_confirmation = "mismatch" } 

      specify { expect(build_user).not_to be_valid }
    end

    context "when 沒有給 password_confirm" do 
      before { build_user.password_confirmation = nil } 

      specify { expect(build_user).not_to be_valid }
    end
  end
end
