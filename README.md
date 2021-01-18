# テーブル設計

## users テーブル

| Column        | Type   | Options  |
| ------------- | ------ | -------- |
| niku_name     | text   | NOT NULL |
| name          | text   | NOT NULL |
| katakana_name | text   | NOT NULL |
| nenn          | int    | NOT NULL |
| tuki          | int    | NOT NULL |
| hi            | int    | NOT NULL |
| me-ru         | text   | NOT NULL |
| pass          | text   | NOT NULL |

## syuppin

| Column       | Type   | Options  |
| ------------ | ------ | -------- |
| sina_name    | text   | NOT NULL |
| sina_setumei | text   | NOT NULL |
| kategori     | text   | NOT NULL |
| sina_zyoutai | text   | NOT NULL |
| haisouryou   | text   | NOT NULL |
| hassousaki   | text   | NOT NULL |
| hassou_day   | text   | NOT NULL |
| kakau        | int    | NOT NULL |
| image        | int    | NOT NULL |

## kounyuu_kiroku

| Column        | Type   | Options  |
| ------------- | ------ | -------- |
| ka-do_bangou  | int    | NOT NULL |
| kigenn        | int    | NOT NULL |
| syouken_ko-do | int    | NOT NULL |

## zyuusyo

| Column         | Type   | Options  |
| -------------- | ------ | -------- |
| yuubinn_bangou | int    | NOT NULL |
| ken            | text   | NOT NULL |
| zititai        | text   | NOT NULL |
| fandei         | text   | NOT NULL |
| tatemono_mei   | text   | NOT NULL |
| denwa_bamgou   | int    | NOT NULL |