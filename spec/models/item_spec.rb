require 'rails_helper'
describe Item do
  describe '#create' do

    # すべての項目が入力されていれば出品できる
    it "is valid with item_image,name,detail,price,category_id,shipping_fee_id,condition_id,shipping_from_id,preparation_day_id,user_id " do
      item = build(:item)
      item.valid?
      expect(item).to be_valid
    end

    # 画像がないと出品できない
    it "is invalid without an image" do
      item = build(:item)
      item.item_images.clear
      item.valid?
      expect(item.errors[:item_images]).to include("can't be blank")
    end

    # 商品名がなければ出品できない
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 詳細がなければ出品できない
    it "is invalid without a detail" do
      item = build(:item, detail: "")
      item.valid?
      expect(item.errors[:detail]).to include("can't be blank")
    end

    # カテゴリがなければ出品できない
    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    # 配送料がなければ出品できない
    it "is invalid without a shipping_fee_id" do
      item = build(:item, shipping_fee_id: "")
      item.valid?
      expect(item.errors[:shipping_fee_id]).to include("can't be blank")
    end

    # 商品の状態がなければ出品できない
    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    # 配送元エリアがなければ出品できない
    it "is invalid without a shipping_from_id" do
      item = build(:item, shipping_from_id: "")
      item.valid?
      expect(item.errors[:shipping_from_id]).to include("can't be blank")
    end

    # 発送までの日数がなければ出品できない
    it "is invalid without a preparation_day_id" do
      item = build(:item, preparation_day_id: "")
      item.valid?
      expect(item.errors[:preparation_day_id]).to include("can't be blank")
    end

    # ユーザーIDがなければ出品できない
    it "is invalid without an user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

    # 価格がなければ出品できない
    it "is invalid without price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    # ブランド(任意)を入力しても出品できる
    it "is valid with brand" do
      item = build(:item, brand: "adidas")
      item.valid?
      expect(item).to be_valid
    end

  end
end