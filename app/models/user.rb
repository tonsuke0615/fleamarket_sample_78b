class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :nickname, :email, :password, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :nickname, uniqueness: true
  has_one :profile, dependent: :destroy
  has_one :destination, dependent: :destroy

end
