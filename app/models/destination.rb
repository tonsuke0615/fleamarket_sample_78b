class Destination < ApplicationRecord
  belongs_to :user
  validates :destinaion_first_name, :destination_family_name, :destinaion_first_name_kana, :destination_family_name_kana, :post_code, :prefecture, :city, :address, :user, presence: true
end
