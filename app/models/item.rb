class Item < ApplicationRecord
  has_many :images,inverse_of: :item
  has_many :item_categories, dependent: :destroy
  belongs_to :categorie
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :derivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_untill_shipping

  validates :name,length: { in: 1..40 }
  validates :explanation,length: { in: 1..1000 }
  validates :price_id, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300}
  validates :category_id, :condition_id, :derivery_fee_id,:shipping_area_id, :days_untill_shipping_id, presence: true
end
