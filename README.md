# 概要

商品を出品したり購入ができるフリマアプリです。
herokuの仕様上、当日出品されたアイテムの画像しか表示されません。

## フリマアプリのURL
https://furima-31652.herokuapp.com/

・Basic認証のID：furima
・パスワード ：31652

・出品者用のメールアドレス：sell@sample
パスワード ：sample1

・購入者用のメールアドレス：buy@sample
パスワード ：sample1

・購入用カードの番号：4242424242424242
期限：現在より未来
セキュリティコード：123

### usersテーブル

| Column             | Type    | Options                 |
| ------------------ | ------- | ----------------------- |
| email              | string  | null: false unique: true|
| encrypted_password | string  | null: false             |
| nickname           | string  | null: false             |
| first_name         | string  | null: false             |
| last_name          | string  | null: false             |
| first_kana         | string  | null: false             |
| last_kana          | string  | null: false             |
| birthday           | date    | null: false             |

#### Association
- has_many :items
- has_many :orders

### itemsテーブル(imageは記載なし)

| Column                 | Type       | Options                       |
| ---------------------  | ---------- | ----------------------------- |
| title                  | text       | null: false                   |
| introduction           | text       | null: false                   |
| category_id            | integer    | null: false                   |
| condition_id           | integer    | null: false                   |
| shipping_charge_id     | integer    | null: false                   |
| shipping_prefecture_id | integer    | null: false                   |
| shipping_day_id        | integer    | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | null: false foreign_key: true |

#### Association
- belongs_to :user
- has_one :order

### ordersテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_key: true |
| item   | references | null: false foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :order
- has_one :order_address
 
### order_addressesテーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_number        | string     | null: false                   |
| home_prefecture_id | integer    | null: false                   |
| home_town          | string     | null: false                   |
| home_address       | string     | null: false                   |
| building           | string     |                               |
| phone_number       | string     | null: false                   |
| order              | references | null: false foreign_key: true |

#### Association
- belongs_to :order



