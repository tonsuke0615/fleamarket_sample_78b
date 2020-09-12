class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :shippingfee
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_from
  belongs_to_active_hash :preparation_day
  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  validates :name, :price, :category, :shippingfee, :condition, :shipping_from, :preparation_day, :user, presence: true
end
