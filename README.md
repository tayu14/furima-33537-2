# テーブル設計

## users テーブル

| Column              | Type   | Options  |
| ------------------- | ------ | -------- |
| niku_name           | string | NOT NULL |
| namae               | string | NOT NULL |
| myouzi              | string | NOT NULL |
| namae_kana          | string | NOT NULL |
| myouzi_kana         | string | NOT NULL |
| birthday            | date   | NOT NULL |
| email               | string | NOT NULL |
| encrypted_password  | string | NOT NULL |

### Association

- has_many : syuppins
- has_many : kounyuu_kirokus

## syuppin_id

| Column                 | Type    | Options  |
| ---------------------- | ------- | -------- |
| sina_name              | string  | NOT NULL |
| sina_setumei           | text    | NOT NULL |
| category_id            | integer | NOT NULL |
| status_id              | integer | NOT NULL |
| prefecure_money_id     | integer | NOT NULL |
| prefecure_id           | integer | NOT NULL |
| scheduled_delivery_id  | integer | NOT NULL |
| kakau                  | integer | NOT NULL |

### Association

- belongs_to : user
- has_one    : kounyuu_kiroku

## kounyuu_kiroku

| Column  | Type       | Options  |
| ------- | ---------- | -------- |
| user    | references | NOT NULL |
| syuppin | references | NOT NULL |

### Association

- belongs_to : user
- belongs_to : syuppin
- has_one    : zyuusyo

## zyuusyo

| Column         | Type       | Options  |
| -------------- | ---------- | -------- |
| yuubinn_bangou | string     | NOT NULL |
| ken            | integer    | NOT NULL |
| prefecure      | string     | NOT NULL |
| fandei         | string     | NOT NULL |
| tatemono_mei   | string     |          |
| denwa_bamgou   | string     | NOT NULL |
| kounyuu_kiroku | references |
### Association

- belongs_to : kounyuu_kiroku