# users

| Column    | Type    | Option      |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |

## Association
- has_many :products
- has_many :buys

# products

| Column          | Type      | Option                         |
| --------------- | --------- | ------------------------------ |
| name            | string    | null: false                    |
| content         | text      | null: false                    |
| category        | string    | null: false                    |
| status          | string    | null: false                    |
| price           | integer   | null: false                    |
| delivery_charge | string    | null: false                    |
| city            | string    | null: false                    |
| days            | string    | null: false                    |
| user_id         | reference | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :buy

# buys

| Column      | Type      | Option                         |
| ----------- | --------- | ------------------------------ |
| credit_card | integer   | null: false                    |
| postal_code | integer   | null: false                    |
| prefecture  | string    | null: false                    |
| city        | string    | null: false                    |
| address     | string    | null: false                    |
| building    | string    |                                |
| room_num    | integer   |                                |
| telephone   | integer   | null: false                    |
| user_id     | reference | null: false, foreign_key: true |
| product_id  | reference | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :product
