# README

## users テーブル

|Column|Type|Options|
|------|----|-------|
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
（ここに追記していく）


### Association
（ここに追記していく）

## items テーブル

|Column|Type|Options|
|------|----|-------|
| item_name               | string | null: false |
| category           | string | null: false |
| price              | decimal | null: false |
| user_id            | references | nulll false foreign_key: true |
（ここに追記していく）

## purchase テーブル

|Column|Type|Options|
|------|----|-------|
| user_id            | references | nulll false foreign_key: true |
| item_id            | references | nulll false foreign_key: true |


（ここに追記していく）


## shipping テーブル

|Column|Type|Options|
|------|----|-------|
| user_id            | references | nulll false foreign_key: true |
| street             | string     | null: false |
| city               | string     | null: false |
| state              | string     | null: false |
| postal_code        | string     | null: false |
| country            | string     | null: false |

（ここに追記していく）


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
