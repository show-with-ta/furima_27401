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
|id|integer|null: false, unique: true|
|name|string|null: false|
|email|string|null:false, unique: true|
|password|string|null: false|
|family_name|integer|null: false|
|family_name_kana|integer|null: false|
|given_name|integer|null: false|
|given_name_kana|integer|null: false|
|birthday|integer|null: false|
|address_id|integer||
|credit_card_id|integer||

### Association
- has_many :addresses
- has_many :credit_cards
- has_many :products

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|prefecture|string|null: false|

### Association
- belongs_to :user

## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|number|integer|null: false, unique: true|
|expiration_date|integer|null: false|
|security_code|integer|mull: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## productsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|image|string|null: false|
|name|string|null: false|
|detail|text|null: false|
|shipping_fee|string|null: false|
|shipping_origin|string|null: false|
|shipping_day|string|nul: false|
|price|integer|null: false|
|condition|string|null: false|
|user_id||null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|name|integer|null: false|

### Association
- has_many :products

## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|name|integer|null: false|

### Association
- has_many :products
