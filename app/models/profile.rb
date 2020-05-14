class Profile < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  belongs_to :user, optional: true

  validates :firstname, :lastname, presence: true, format: { with: /[ぁ-んァ-ン一-龥]/, message: '全角で入力してください' }
  validates :firstname_kana, :lastname_kana, presence: true, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/, message: '全角カタカナのみで入力してください' }
  validates :birthday, presence: true
  validates :postal_code, :prefecture_id, :city, :address, presence: true
end
