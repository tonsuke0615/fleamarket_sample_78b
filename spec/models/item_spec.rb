require 'rails_helper'
describe Item do
  describe '#create' do

    it "is valid with item_image,name,detail,price,category_id,shippingFee_id,condition_id,shippingFrom_id,preparationDay_id,user_id " do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end

    it "is invalid without an image" do
      item = build(:item)
      item.item_images.clear
      item.valid?
      expect(item.errors[:item_images]).to include("can't be blank")
    end

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a detail" do
      item = build(:item, detail: "")
      item.valid?
      expect(item.errors[:detail]).to include("can't be blank")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a shippingFee_id" do
      item = build(:item, shippingFee_id: "")
      item.valid?
      expect(item.errors[:shippingFee_id]).to include("can't be blank")
    end

    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "is invalid without a shippingFrom_id" do
      item = build(:item, shippingFrom_id: "")
      item.valid?
      expect(item.errors[:shippingFrom_id]).to include("can't be blank")
    end

    it "is invalid without a preparationDay_id" do
      item = build(:item, preparationDay_id: "")
      item.valid?
      expect(item.errors[:preparationDay_id]).to include("can't be blank")
    end

    it "is invalid without an user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

  end
end