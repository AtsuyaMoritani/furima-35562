# README

users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name        | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| nickname    | string | null: false |
| birthday    | string | null: false |


items テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| item_name   | string     | null: false                    |
| category    | string     | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |


buyers テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| comment     | text       | null: false                    |
| buyer       | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |


buyer_address テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |
| buyers      | references | null: false, foreign_key: true |


comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |