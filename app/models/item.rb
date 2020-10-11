class Item < ApplicationRecord
  # belongs_to :user
  belongs_to :category
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shippingFee
  belongs_to_active_hash :shippingFrom
  belongs_to_active_hash :preparationDay

  # テーブル未作成のため下記コメントアウト中。実装で必要になったタイミングで外してください
  # has_one :order
  # has_many :comments, dependent: :destroy

  validates :name, :detail, :price, :category, :shippingFee_id, :condition_id, :shippingFrom_id, :preparationDay_id, presence: true
  validates_associated :item_images
  validates :item_images, presence: true
end
