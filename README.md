# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| describe             | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| shipping_charge_id   | integer    | null: false                    |
| ship_from_id         | integer    | null: false                    |
| delivery_duration_id | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ------     | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address



## shipping_addresses テーブル

| Column          | Type       | Options                        |
| ------          | ------     | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_record | references | null: false, foreign_key: true |



### Association

- belongs_to :purchase_record
