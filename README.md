# README

# :camera: App Name

## スポ（ット）フォト
![app-top-page](https://user-images.githubusercontent.com/63793009/84601570-2705d600-aebc-11ea-8406-dd8054da8086.jpg)


# :speech_balloon: What's this?
Maps JavaScript API & Geocoding API を利用した、スポットの情報交換・交流サイトです。
トップページのマップでは登録されたスポットの位置を確認でき、  
マーカーをクリックすることで、吹き出しから、そのスポットの詳細を見ることもできます。

※現在、マップ表示にてFor development purposes onlyと表示されます。  ※
※見ずらい状態ですが、アプリの機能については問題ありません。ご容赦ください。※

# :globe_with_meridians: App URL

## https://spo-photo.herokuapp.com/

# :pencil: ER Diagram

![erd-5_page-0001](https://user-images.githubusercontent.com/63793009/84599339-4268e500-aeac-11ea-9c91-7fe1650e31ff.jpg)

# :computer: 開発環境

- Ruby
- Rails
- Scss
- jQuery
- Maps JavaScript API
- Geocoding API
- MySQL(開発環境サーバー)
- Heroku (本番環境サーバー)
- S3(AWS)(画像アップロード先)

# :art: DataBase Disign

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|avatar|string|null: false, limit: 12|
|email|string|null: false, unique: true|
|introduction|text|default: ""|
|nickname|string|null: false, limit: 12|
|password|string|null: false|

### Association
 - has_many    :spots,        dependent: :destroy
 - has_many    :comments,     dependent: :destroy
 - has_many    :likes,        dependent: :destroy
 - has_many    :liked_spots,  through:   :likes, source: :spot


## spotsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 25|
|main_visual|string|null: false|
|information|string||
|address|string||
|latitude|float||
|longitude|float|
|user_id|references|foreign_key: true, null: false|

### Association
 - belongs_to   :user
 - has_many     :comments,    dependent: :destroy
 - has_many     :likes,       dependent: :destroy
 - has_many     :liked_users, through:   :likes, source: :user


 ## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: ture, null: false|
|spot_id|references|foreign_key: true, null: false|

### Association
- belongs_to :user
- belongs_to :spot


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false, limit: 30|
|user_id|references|foreign_key: true, null: false|
|spot_id|references|foreign_key: ture, null: false|

### Association
 - belongs_to :user
 - belongs_to :spot




