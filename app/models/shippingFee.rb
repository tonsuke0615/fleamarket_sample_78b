class ShippingFee < ActiveHash::Base
  self.data = [
    {id: 1, status: "送料込み(出品者が負担)"}, {id: 2, status: "着払い(購入者が負担)"}
  ]

  include ActiveHash::Associations
  has_many :items

end