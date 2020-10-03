# テーブル設計

## users

| Column          | Type          | Options                                      |
| --------------- | ------------- | -------------------------------------------- |
| email           | string        | null: false                                  |
| password        | string        | null: false                                  |
| nickname        | string        | null: false                                  |
| last_name       | string        | null: false                                  |
| first_name      | string        | null: false                                  |
| last_name_kana  | string        | null: false                                  |
| first_name_kana | string        | null: false                                  |
| birth_date      | integer       | null: false                                  |

- has_many :items
- has_many :orders


## items

| Column          | Type          | Options                                      |
| --------------- | ------------- | -------------------------------------------- |
| name            | string        | null: false                                  |
| text            | text          | null: false                                  |
| category        | integer       | null: false                                  |
| condition       | integer       | null: false                                  |
| postage         | integer       | null: false                                  |
| shipment_source | integer       | null: false                                  |
| shipment_day    | integer       | null: false                                  |
| price           | integer       | null: false                                  |
| user            | references    | null: false, foreign_key: true               |

- belongs_to :user
- has_one :order


## buyers

| Column           | Type          | Options                                      |
| ---------------- | ------------- | -------------------------------------------- |
| post_code        | string        | null: false                                  |
| prefecture       | integer       | null: false                                  |
| city             | string        | null: false                                  |
| address          | string        | null: false                                  |
| building_name    | string        | null: false                                  |
| phone_number     | string        | null: false                                  |

- has_many :orders

## orders

| Column           | Type          | Options                                      |
| ---------------- | ------------- | -------------------------------------------- |
| user             | references    | null: false                                  |
| item             | references    | null: false                                  |
| buyer            | references    | null: false                                  |

- belongs_to :user
- belongs_to :buyer
- belongs_to :item