## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル(imageは記載なし)

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| title        | text       | null: false                   |
| introduction | text       | null: false                   |
| price        | integer    | null: false                   |
| user         | references | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_key: true |
| item   | references | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :order
- has_one :order_address
 
## order_addressesテーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| post_number  | integer    | null: false                   |
| home_town    | string     | null: false                   |
| home_address | string     | null: false                   |
| building     | string     |                               |
| phone_number | integer    | null: false                   |
| order        | references | null: false foreign_key: true |

### Association
- belongs_to :order



