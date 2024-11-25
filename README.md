# README

## users テーブル

|Column|Type|Options|
|------|----|-------|
| nickname           | string | null: false |
| email              | string | null: false,unique: true |
| password              | string | null: false |
| password_confirmation | string | null: false |
| name_last          | string | null: false |
| name_first         | string | null: false |
| name_last_kana     | string | null: false |
| name_first_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
has_many :items
has_many :purchases
has_many :shippings


## items テーブル

|Column|Type|Options|
|------|----|-------|
| name                    | string      | null: false |
| description             | text        | null: false |
| condition_id            | integer     | null: false |
| category_id             | integer     | null: false |
| price                   | integer     | null: false |
| user_id                 | references  | null: false, foreign_key: true |

### Association
belongs_to



## purchases テーブル

|Column|Type|Options|
|------|----|-------|
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
belongs_to



## shippings テーブル
|Column|Type|Options|
|------|----|-------|
| postal_code        | string      | null: false |
| prefecture_id      | integer     | null: false |
| city              | string      | null: false |
| street_address    | string      | null: false |
| building_name     | string      |             |
| phone_number      | string      | null: false |


### Association
has_one


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
