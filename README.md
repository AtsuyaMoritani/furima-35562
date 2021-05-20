# README

users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| email              | string | unique : true null: false |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |
  
  has_many :items
  has_many :buyers



items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| category_id          | integer    | null: false                    |
| price                | integer    | null: false                    |
| product_description  | text       | null: false                    |
| product_condition_id | integer    | null: false                    |
| ship_base_id         | integer    | null: false                    |
| region_id            | integer    | null: false                    |
| ship_date_id         | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

  has_one :buyer
  belongs_to :user


buyers テーブル

| Column      | Type       | Options                                      |
| ------------| ---------- | -------------------------------------------- |
| user        | references | null: false, foreign_key: true               |
| item        | references | null: false, foreign_key: true               |

  belongs_to :user
  belongs_to :item
  has_one :buyer_address


buyer_address テーブル

| Column                    | Type       | Options                        |
| --------------------------| ---------- | ------------------------------ |
| buyer                     | references | null: false, foreign_key: true |
| postal_code               | string     | null: false                    |
| region_id                 | integer    | null: false                    |
| city                      | string     | null: false                    |
| address                   | string     | null: false                    |
| building_name             | string     |                                |
| phone_number              | string     | null: false                    |

  belongs_to :buyer
