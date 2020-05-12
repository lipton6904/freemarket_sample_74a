class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :derivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_untill_shippin
end
