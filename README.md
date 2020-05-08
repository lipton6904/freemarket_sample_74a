
## user
|Column|Type|Options|
|------|----|-------|
|nickname |string | null: false|
|first_name |string | null: false|
|last_name |string | null: false|
|first_name_kana |string | null: false|
|last_name_kana |string | null: false|
|birth_year |data | null: false|
|birth_month |data | null: false|
|birth_day |data | null: false|
|email|string|null: false|
|password|string|null: false|
##Association
-has_one :profile
-has_many :items
-has_many :credit_cards
-has_many :user_products 


## profiles
|Column|Type|Options|
|------|----|-------|
|user_id |references|null: false |foreign_key: true|
|first_name|string|null: false|
|last_name |string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string|null: true|
|tell_number|string|null: true|
##Association
-belongs_to :user




##items
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|explanation|text|nul: false|
|category|references|null: false|foreign_key: true|
|size|references|null: false|foreign_key: true|
|brand|references|foreign_key: true|
|condition_id|references|null: false|foreign_key: true|
|derivery_fee_id|references|null: false|foreign_key: true|
|shipping_area_id |string | null: false|
|days_untill_shipping_id|references|null: false|foreign_key: true|
|status _id|enum|null: false|
##Association
-belongs_to :category
-has_many :images
-belongs_to_active_hash :size
-belongs_to_active_hash :condition_id
-belongs_to_active_hash :derivery_fee_id
-belongs_to_active_hash :shipping_area_id
-belongs_to_active_hash :days_untill_shipping_id

##image
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|reference|null: false|index: true|foreign_key: true|
##Association
-belongs_to :item


##categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
##Association
-has_many :items 

##credit_cards
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|effectivedate_year|integer|null: false|
|effectivedate_month|integer|null: false|
|user_id|references|null: false|foreign_key: true|
##Association
-belongs_to :user 

##user_products
|item_id|references|null: false|foreign_key: true|
|seller_id|references|null: false|foreign_key: true|
|buyer_id|references|null: false|foreign_key: true|
##Association
-belongs_to :user
-belongs_to :item