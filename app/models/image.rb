class Image < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :image, ImageUploader
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture  
end
