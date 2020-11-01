class Item < ApplicationRecord

  belongs_to :user
  belongs_to :category
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_from
  belongs_to_active_hash :preparation_day

  # テーブル未作成のため下記コメントアウト中。実装で必要になったタイミングで外してください
  # has_one :order
  # has_many :comments, dependent: :destroy

  # ユーザ登録機能実装後に、下記にuser_idも追加する
  validates :user_id, :name, :detail, :price, :shipping_fee_id, :condition_id, :shipping_from_id, :preparation_day_id, presence: true
  validates_associated :item_images
  validates :item_images, presence: true
end
