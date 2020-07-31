# README

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


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|prime_key: true|
|nickname|string|null: false|
|email|string|null:false, unique: true|
|password|string|null: false|
|family_name|integer|null: false|
|family_name_kana|integer|null: false|
|first_name|integer|null: false|
|first_name_kana|integer|null: false|
|birthday|integer|null: false|

### Association
- has_many :items

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|image|string|null: false|
|name|string|null: false|
|detail|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|postage_payer_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|shipping_day_id|string|nul: false, foreign_key: true|
|price|integer|null: false|
|user_id||null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_day
- belongs_to :brand

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|name|string|null: false|

### Association
- has_many :items


