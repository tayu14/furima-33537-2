# テーブル設計

## users テーブル

| Column              | Type   | Options  |
| ------------------- | ------ | -------- |
| niku_name           | string | NOT NULL |
| first_name          | string | NOT NULL |
| family_name         | string | NOT NULL |
| first_name_kana     | string | NOT NULL |
| family_name_kana    | string | NOT NULL |
| birthday            | date   | NOT NULL |
| email               | string | NOT NULL |
| encrypted_password  | string | NOT NULL |

### Association

- has_many : items
- has_many : orders

## items

| Column                 | Type    | Options  |
| ---------------------- | ------- | -------- |
| goods_name             | string  | NOT NULL |
| goods_explanation      | text    | NOT NULL |
| category_id            | integer | NOT NULL |
| status_id              | integer | NOT NULL |
| prefecure_money_id     | integer | NOT NULL |
| prefecure_id           | integer | NOT NULL |
| scheduled_delivery_id  | integer | NOT NULL |
| price                  | integer | NOT NULL |

### Association

- belongs_to : user
- has_one    : order

## orders

| Column  | Type       | Options  |
| ------- | ---------- | -------- |
| user    | references | NOT NULL |
| item    | references | NOT NULL |

### Association

- belongs_to : user
- belongs_to : item
- has_one    : address

## address

| Column         | Type       | Options  |
| -------------- | ---------- | -------- |
| postal_code    | string     | NOT NULL |
| prefecure      | integer    | NOT NULL |
| municipality   | string     | NOT NULL |
| fandee         | string     | NOT NULL |
| bill           | string     |          |
| phone_number   | string     | NOT NULL |
| order          | references |
### Association

- belongs_to : order