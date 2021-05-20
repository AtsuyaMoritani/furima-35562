# README

users テーブル

| Column      | Type   | Options            |
| ----------- | ------ | ------------------ |
| last_name   | string | null: false        |
| first_name  | string | null: false        |
| email       | string | unique : true      |
| nickname    | string | null: false        |
| birthday    | date   | null: false        |
  
  has_many :items
  has_many :buyers
  has_many :buyer_address
  has_many :comments



items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| category            | integer    | null: false                    |
| price               | integer    | null: false                    |
| product_description | text       | null: false                    |
| product_condition   | string     | null: false                    |
| ship_base           | string     | null: false                    |
| ship_address        | string     | null: false                    |
| ship_date           | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

  has_many :buyers
  has_one :comments
  has_one :buyer_address
  belongs_to :users


buyers テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| comment     | text       | null: false                    |
| buyer       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |


buyer_address テーブル

| Column                    | Type       | Options                        |
| --------------------------| ---------- | ------------------------------ |
| user                      | references | null: false, foreign_key: true |
| item                      | references | null: false, foreign_key: true |
| buyers                    | references | null: false, foreign_key: true |
| card_number               | integer    | null: false                    |
| exp_month                 | integer    | null: false                    |
| exp_year                  | integer    | null: false                    |
| credit_card_approval_code | integer    | null: false                    |
| postal_code               | integer    | null: false                    |
| region                    | string     | null: false                    |
| city                      | string     | null: false                    |
| address                   | string     | null: false                    |
| building_name             | string     |                                |
| phone_number              | integer    | null: false                    |


comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |