require 'rails_helper'
describe User do
  describe '#create' do
    # 1
    it "nickname, email, password, password_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    # 2
    it "nickname無しでは登録できないこと" do
      # user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    # 3
    it "email無しでは登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    # 4
    it "password無しでは登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    # 5
    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    # 6
    it "重複したnicknameが存在する場合登録できないこと" do
      user = create(:user, nickname: "abe")
      another_user = build(:user, nickname: "abe")
      another_user.valid?
      expect(another_user.errors[:nickname]).to include("has already been taken")
    end
    # 7
    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    # 8
    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "1234567", password_confirmation: "1234567")
      user.valid?
      expect(user).to be_valid
    end
    # 9
    it "passwordが6文字以下である場合は登録できないこと" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end