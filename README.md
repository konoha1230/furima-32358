# README

## users

| Column          | Type    | Option      |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association
- has_many :products
- has_many :managements

## products

| Column          | Type      | Option                         |
| --------------- | --------- | ------------------------------ |
| name            | string    | null: false                    |
| content         | text      | null: false                    |
| user_id         | reference | null: false, foreign_key: true |
| delivery_id     | integer   | null: false                    |

### Association
- belongs_to :user
- has_one :management

## managements

| Column     | Type      | Option                         |
| ---------- | --------- | ------------------------------ |
| user_id    | reference | null: false, foreign_key: true |
| product_id | reference | null: false, foreign_key: true |

### Association
- has_one :buy
- belongs_to :user
- belongs_to :product


## buys

| Column      | Type      | Option                         |
| ----------- | --------- | ------------------------------ |
| postal_code | integer   | null: false                    |
| prefecture  | string    | null: false                    |
| city        | string    | null: false                    |
| address     | string    | null: false                    |
| building    | string    |                                |
| room_num    | integer   |                                |
| telephone   | integer   | null: false                    |

### Association
- belongs_to :management
