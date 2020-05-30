# README

# DataBase Disign

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|avatar|string||
|introduction|text||
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
 - has_many :spots, dependent: :destroy


## spotsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|thumbnail|string|null: false|
|text|string||
|user_id|references|foreign_key, null: false|
|category_id|references|foreign_key, null: false|

### Association
 - belongs_to :user
 - belongs_to :category
 - has_one :map


## mapsテーブル #google maps api
|Column|Type|Options|
|------|----|-------|
|address|string|null: false|
|latitude|float|null: false|
|longitude|float|null: false|
|spot_id|references|foreign_key: true, null: false|

### Association
 - belongs_to:spot


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
 - has_many :spots
 - has_ancestry




