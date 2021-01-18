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
| me-ru               | string | NOT NULL |
| encrypted_password  | string | NOT NULL |

### Association

- has_many : syuppin
- has_many : kounyuu_kiroku

## syuppin

| Column       | Type    | Options  |
| ------------ | ------- | -------- |
| sina_name    | string  | NOT NULL |
| sina_setumei | text    | NOT NULL |
| kategori_id  | integer | NOT NULL |
| sina_zyoutai | text    | NOT NULL |
| haisouryou   | integer | NOT NULL |
| hassousaki   | text    | NOT NULL |
| hassou_day   | integer | NOT NULL |
| kakau        | integer | NOT NULL |

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

| Column         | Type   | Options  |
| -------------- | ------ | -------- |
| yuubinn_bangou | string | NOT NULL |
| ken            | string | NOT NULL |
| zititai        | string | NOT NULL |
| fandei         | string | NOT NULL |
| tatemono_mei   | string |          |
| denwa_bamgou   | string | NOT NULL |

### Association

- belongs_to : kounyuu_kiroku