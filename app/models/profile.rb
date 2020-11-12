class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_date, presence: true
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}, presence: true
end