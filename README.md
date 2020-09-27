# README


## users table

|Column|Type|Options|
|------|----| -------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_one :profile, dependent: :destroy
- has_one :destination, dependent: :destroy
- has_many :orders, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_one :creditcard, dependent: :destroy


## profiles table

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string||null: false|
|family_name_kana|string||null: false|
|birth_date|date|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## destinations table

|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone|string||
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## creditcards table

|Column|Type|Options|
|------|----|-------|
|card_id|references|null: false, foreign_key: true|
|customer_id|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
<!-- コードレビューしていないため、referenece型かinteger型なのかはテーブル作成時に要確認 -->

## Association
- belongs_to :user


## orders table
|Column|Type|Options|
|------|----|-------|
|created_at|datetime||
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## items table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text||
|price|integer|null: false|
|category|references|null: false, foreign_key: true|
|brand|string||
|shipping_fee|integer|null: false|
|condition|integer|null: false|
|shipping_from|integer|null: false|
|preparation_day|integer|null: false|
|user|references|null: false, foreign_key: true|
<!-- active_hashを使用するものはreference型ではなくintegerでforeign_keyも使用しない（レビューにて確認済） -->

### Association

- belongs_to :brand
- belongs_to :user
- belongs_to :category
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_from
- belongs_to_active_hash :preparation_day
- has_one :order
- has_many :comments, dependent :destroy
- has_many :item_images, dependent :destroy


## categories table
|Column|Type|Options|
|name|string|null: false|
|ancestry|string||

### Association
 - has_many :items


## brands table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## item_images table

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item|references|null: false, foreign_key: true|

###Association

- belongs_to :item

<!-- 以下は追加実装のため最初は不要 -->
## comments table

|Column|Type|Options|
|------|----|-------|
|comment|text||
|user|references|foreign_key: true|
|item|references|foreign_key: true|
|created_at|datetime||

### Association

- belongs_to :user
- belongs_to :item



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
