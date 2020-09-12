class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date, :user, presence: true
end
