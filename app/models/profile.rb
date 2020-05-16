class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user, optional: true

  validates :first_name, :last_name, presence: true
  validates :first_name_kana, :last_name_kana, presence: true
  validates :post_code, :city, :house_number, presence: true
  validates :prefecture_id, presence: true

end
