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
| birth_year      | integer       | null: false                                  |
| birth_month     | integer       | null: false                                  |
| birth_day       | integer       | null: false                                  |

- has_many :items
- has_many :buyers


## items

| Column          | Type          | Options                                      |
| --------------- | ------------- | -------------------------------------------- |
| name            | string        | null: false                                  |
| text            | text          | null: false                                  |
| category        | string        | null: false                                  |
| condition       | string        | null: false                                  |
| postage         | string        | null: false                                  |
| shipment_source | string        | null: false                                  |
| shipment_days   | integer       | null: false                                  |
| price           | integer       | null: false                                  |
| user            | references    | null: false, foreign_key: true               |

- belongs_to :user
- belongs_to :buyer


## buyers

| Column           | Type          | Options                                      |
| ---------------- | ------------- | -------------------------------------------- |
| card_number      | integer       | null: false                                  |
| card_limit_month | integer       | null: false                                  |
| card_limit_year  | integer       | null: false                                  |
| security_code    | integer       | null: false                                  |
| post_code        | integer       | null: false                                  |
| prefectures      | string        | null: false                                  |
| city             | string        | null: false                                  |
| address          | string        | null: false                                  |
| building_name    | string        | null: false                                  |
| phone_number     | integer       | null: false                                  |
| user             | references    | null: false, foreign_key: true               |
| item             | references    | null: false, foreign_key: true               |

- has_many :items
- belongs_to :user

