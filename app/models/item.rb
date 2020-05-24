class Item < ApplicationRecord
  has_many :images,inverse_of: :item
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :categorie, optional: true
  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :derivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_untill_shipping

  validates :images, presence: true, length: {manimum: 1, maximum: 10}
  validates :name,length: { in: 1..40 }
  validates :explanation,length: { in: 1..1000 }
  validates :price_id, numericality: { less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  validates :categorie_id, :condition_id, :derivery_fee_id,
            :shipping_area_id, :days_untill_shipping_id, presence: true
end