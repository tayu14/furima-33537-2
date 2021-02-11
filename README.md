# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nick_name           | string | null: false |
| first_name          | string | null: false |
| family_name         | string | null: false |
| first_name_kana     | string | null: false |
| family_name_kana    | string | null: false |
| birthday            | date   | null: false |
| email               | string | null: false,unique: true |
| encrypted_password  | string | null: false |

### Association

- has_many : items
- has_many : orders

## items

| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| goods_name             | string     | null: false |
| goods_explanation      | text       | null: false |
| category_id            | integer    | null: false |
| status_id              | integer    | null: false |
| prefecure_money_id     | integer    | null: false |
| prefecure_id           | integer    | null: false |
| scheduled_delivery_id  | integer    | null: false |
| price                  | integer    | null: false |
| user                   | references | foreign_key: true |

### Association

- belongs_to : user
- has_one    : order

## orders

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

- belongs_to : user
- belongs_to : item
- has_one    : address

## addresses

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefecure_id   | integer    | null: false |
| municipality   | string     | null: false |
| fandee         | string     | null: false |
| bill           | string     |             |
| phone_number   | string     | null: false |
| order          | references | foreign_key: true |
### Association

- belongs_to : order