
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
| birth_date      | date          | null: false                                  |

- has_many :items
- has_many :orders


## items

| Column             | Type         | Options                                      |
| ------------------ | ------------ | -------------------------------------------- |
| name               | string       | null: false                                  |
| text               | text         | null: false                                  |
| category_id        | integer      | null: false                                  |
| condition_id       | integer      | null: false                                  |
| postage_id         | integer      | null: false                                  |
| shipment_source_id | integer      | null: false                                  |
| shipment_day_id    | integer      | null: false                                  |
| price              | integer      | null: false                                  |
| user               | references   | null: false, foreign_key: true               |

- belongs_to :user
- has_one :order


## buyers

| Column           | Type          | Options                                      |
| ---------------- | ------------- | -------------------------------------------- |
| post_code        | string        | null: false                                  |
| prefecture_id    | integer       | null: false                                  |
| city             | string        | null: false                                  |
| address          | string        | null: false                                  |
| building_name    | string        |                                              |
| phone_number     | string        | null: false                                  |
| order            | references    | null: false, foreign_key: true               |

- belongs_to :order


## orders

| Column           | Type          | Options                                      |
| ---------------- | ------------- | -------------------------------------------- |
| user             | references    | null: false, foreign_key: true               |
| item             | references    | null: false, foreign_key: true               |

- belongs_to :user
- has_one :buyer
- belongs_to :item
