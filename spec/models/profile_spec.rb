require 'rails_helper'
describe User do
  describe '#create_profile' do
    # 1
    it "first_name, family_name, first_name_kana, family_name_kana, birth_dateが存在すれば登録できること" do
      profile = build(:profile)
      expect(profile).to be_valid
    end
    # 2
    it "first_name無しでは登録できないこと" do
      profile = build(:profile, first_name: "")
      profile.valid?
      expect(profile.errors[:first_name]).to include("can't be blank")
    end
    # 3
    it "family_name無しでは登録できないこと" do
      profile = build(:profile, family_name: "")
      profile.valid?
      expect(profile.errors[:family_name]).to include("can't be blank")
    end
    # 4
    it "first_name_kana無しでは登録できないこと" do
      profile = build(:profile, first_name_kana: "")
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be blank")
    end
    # 5
    it "family_name_kana無しでは登録できないこと" do
      profile = build(:profile, family_name_kana: "")
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be blank")
    end
    # 6
    it "birth_date無しでは登録できないこと" do
      profile = build(:profile, birth_date: "")
      profile.valid?
      expect(profile.errors[:birth_date]).to include("can't be blank")
    end
  end
end