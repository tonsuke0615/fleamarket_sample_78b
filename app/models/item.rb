class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # テーブル未作成のため下記コメントアウト中。実装で必要になったタイミングで外してください
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shippingFee
  belongs_to_active_hash :shippingFrom
  belongs_to_active_hash :preparationDay
  # has_one :order
  has_many :item_images, dependent: :destroy
  # has_many :comments, dependent: :destroy
  # accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :name, :detail, :price, :category, :shippingFee, :condition, :shippingFrom, :preparationDay, :user, presence: true
end
