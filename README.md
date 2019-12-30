# README


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|tell|integer|null: false, unique: true|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|sales|integer|null: false|
|image|text||
|deleted_at|datetime|null:false|

### Association
- has_many :items
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy
- has_many :messages dependent: :destroy
- has_one :addresses dependent: :destroy
- has_many :wallets dependent: :destroy
- has_many :reviews dependent: :destroy
- has_many :order dependent: :destroy
- has_many :cards dependent: :destroy

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|post_number|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address_line|string|null: false|
|building_name|string||
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## walletsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|money|integer|null: false|

### Association
- belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|score|integer|null: false|

### Association
- belongs_to :user

## reviewsテーブル

|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|evaluation|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

### cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|references|null: false|
|card_id|references|null: false|

### Associationテーブル
- belongs_to :user


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|text|string|null: false|
|condition|string|null: false|
|shipping_id|references|null: false, foreign_key: true|
|saller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_many :comments dependent: :destroy
- has_many :messages dependent: :destroy
- has_many :likes dependent: :destroy
- has_many :item_images dependent: :destroy
- has_many :reviews
- has_one :shipping
- has_one :order

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false|
|image_url|string|null: false|

### Association
- belongs_to :item

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|buyer_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer||

### Association
- has_many :items

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer||

### Association
- has_many :items

## shippingテーブル
|Column|Type|Options|
|------|----|-------|
|fee_burden|integer|null: false|
|shipping_way|integer|null: false|
|region|integer|null: false|
|handing_time|integer|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item