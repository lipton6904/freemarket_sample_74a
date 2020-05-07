
## users
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
-belongs_to profiles -has_many items
-has_many credit_cards
 -has_many user_product 


## profiles
|Column|Type|Options|
|------|----|-------|
|first_name |string | null: false|
|last_name |string | null: false|
|first_name_kana |string | null: false|
|last_name_kana |string | null: false|
|post_code |integer | null: false|
|prefecture |string | null: false|
|city |string | null: false|
|house_number |string | null: false|
|building |string | null: true|
|phone |string | null: true|
|user_id |references | null:false | foreign_key:true|
##Association
-belongs_to users




## items
|Column|Type|Options|
|------|----|-------|
|image|string|null:false|
|name|string|null:false|
|explanation|text|nul:false|
|status|string|null:false|
|shipping_area|string|null:false|
|price |integer|null:false|
|category_id |references  null:false|foreign_key:true|
##Association
-belongs_to categories -has_many images 

##image
|Column|Type|Options|
|------|----|-------|
|image|string|
|item |reference|
##Association
-belongs_to items


##categories
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry| string|null:false|
##Association
-has_many items 

##credit_cards
|Column|Type|Options|
|------|----|-------|
|number |integer|null: false|
|effectivedate_year|integer|null:false|
|effectivedate_month|integer|null:false|
##Association
-belongs_to user 

##user_products
|item_id |references | null:false | foreign_key:true|
|seller_id |references | null:false | foreign_key:true|
|buyer_id |references | null:false | foreign_key:true|
##Association
-belongs_to user
