# README


## users table

|Column|Type|Options|
|------|----| -------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_one: profile, dependent: destroy
- has_one: destination, dependent: destroy
- has_many: orders
- has_many: comments, dependent: destroy


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
- belongs_to: user


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
- belongs_to: user


## orders table
|Column|Type|Options|
|------|----|-------|
|created_at|datetime||
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- belongs_to: user
- belongs_to: item


## items table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text||
|price|integer|null: false|
|category|integer|null: false|
|brand|references|foreign_key: true|
|shippingfee|references|null: false, foreign_key: true|
|condition|references|null: false, foreign_key: true|
|shipping_from|references|null: false, foreign_key: true|
|preparation_day|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association

- belongs_to: brand
- belongs_to: user
- belongs_to_active_hash: category
- belongs_to_active_hash: shippingfee
- belongs_to_active_hash: condition
- belongs_to_active_hash: shipping_from
- belongs_to_active_hash: preparation_day
- has_many: comments, dependent: destroy
- has_many: item_images, dependent: destroy


## brands table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many: items


## item_images table

|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item|references|null: false, foreign_key: true|

###Association

- belongs_to: item


## comments table

|Column|Type|Options|
|------|----|-------|
|comment|text||
|user|references|foreign_key: true|
|item|references|foreign_key: true|
|created_at|datetime||

###Association

- belongs_to: user
- belongs_to: item



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
