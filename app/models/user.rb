class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_one :profile
  has_one :credit_card, dependent: :destroy
  validates :birth_day, presence: true
  validates :nickname, :encrypted_password, presence: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :email, presence: true, uniqueness: true

  
end
