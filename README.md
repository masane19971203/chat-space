# ChatSpace DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association
- has_many :massages
- has_many :groups, through: :groups_users
- has_many :groups_users
## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text||
|image|text||
|group|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
### Asssociation
- belongs_to :user
- belongs_to :group

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|
### Association
- has_many :users, through: :groups_users
- has_many :messages
- has_many :groups_users

## groups_usersテーブル
|Column|Type|Options|
|------|----|-------|
|group|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

