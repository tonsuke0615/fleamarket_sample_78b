require 'rails_helper'
describe User do
  describe '#create_destination' do
    # 1
    it "destination_first_name, destination_family_name, destination_first_name_kana, destination_family_name_kana, post_code, prefecture, city, addressが存在すれば登録できること" do
      destination = build(:destination)
      expect(destination).to be_valid
    end
    # 2
    it "destination_first_name無しでは登録できないこと" do
      destination = build(:destination, destination_first_name: "")
      destination.valid?
      expect(destination.errors[:destination_first_name]).to include("can't be blank")
    end
    # 3
    it "destination_family_name無しでは登録できないこと" do
      destination = build(:destination, destination_family_name: "")
      destination.valid?
      expect(destination.errors[:destination_family_name]).to include("can't be blank")
    end
    # 4
    it "destination_first_name_kana無しでは登録できないこと" do
      destination = build(:destination, destination_first_name_kana: "")
      destination.valid?
      expect(destination.errors[:destination_first_name_kana]).to include("can't be blank")
    end
    # 5
    it "destination_family_name_kana無しでは登録できないこと" do
      destination = build(:destination, destination_family_name_kana: "")
      destination.valid?
      expect(destination.errors[:destination_family_name_kana]).to include("can't be blank")
    end
    # 6
    it "post_code無しでは登録できないこと" do
      destination = build(:destination, post_code: "")
      destination.valid?
      expect(destination.errors[:post_code]).to include("can't be blank")
    end
    # 7
    it "prefecture無しでは登録できないこと" do
      destination = build(:destination, prefecture: "")
      destination.valid?
      expect(destination.errors[:prefecture]).to include("can't be blank")
    end
    # 8
    it "city無しでは登録できないこと" do
      destination = build(:destination, city: "")
      destination.valid?
      expect(destination.errors[:city]).to include("can't be blank")
    end
    # 9
    it "address無しでは登録できないこと" do
      destination = build(:destination, address: "")
      destination.valid?
      expect(destination.errors[:address]).to include("can't be blank")
    end
  end
end