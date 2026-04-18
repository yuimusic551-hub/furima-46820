# README

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

# DB設計

## users テーブル
（ユーザー情報を保存するテーブル）

## items テーブル
（商品情報を保存するテーブル）

## orders テーブル
（購入記録を保存するテーブル）

## addresses テーブル
（発送先情報を保存するテーブル）


# DB設計

## users テーブル
（ユーザー情報を保存するテーブル）
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
...（以下略）...

## items テーブル
（商品情報を保存するテーブル）
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
...（以下略）...

## orders テーブル
（購入記録を保存するテーブル）
...（表を入れる）...

## addresses テーブル
（発送先情報を保存するテーブル）
...（表を入れる）...


