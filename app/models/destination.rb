class Destination < ApplicationRecord
  belongs_to :user, optional: true
  validates :destination_first_name, :destination_family_name, :destination_first_name_kana, :destination_family_name_kana, :post_code, :prefecture, :city, :address, presence: true
  validates :destination_family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}, presence: true
  validates :destination_first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}, presence: true
  validates :post_code, format: { with: /\A\d{7}\z/}, presence: true

end
