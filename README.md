# README

## users テーブル

|Column|Type|Options|
|------|----|-------|
| nickname           | string | null: false |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false |
| name-last          | string | null: false |
| name-first         | string | null: false |
| name-last-kana     | string | null: false |
| name-first-kana    | string | null: false |
| birth-year_id      | integar | null: false |
| birth-y_id         | integar | null: false |
| birth-year_id      | integar | null: false |

### Association
has_many


## items テーブル

|Column|Type|Options|
|------|----|-------|
| image                   | string      | null: false |
| name                    | string      | null: false |
| description             | string      | null: false |
| condition_id            | integar     | null: false |
| category_id             | integar     | null: false |
| price                   | integar     | null: false |
| user_id                 | references  | nulll false foreign_key: true |

### Association
belongs_to



## purchase テーブル

|Column|Type|Options|
|------|----|-------|
| user_id            | references | nulll false foreign_key: true |
| item_id            | references | nulll false foreign_key: true |

### Association
belongs_to



## shipping テーブル

|Column|Type|Options|
|------|----|-------|
| user_id            | references  | nulll false foreign_key: true |
| prefecture_id      | integar     | null: false |
| days_id            | integar     | null: false |


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
