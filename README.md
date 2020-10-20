# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false             |
| password           | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false
| birth_date         | string              | null: false



### Association

* has_many :items
* has_many :purchases

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| image                               | string     | null: false       |
| name                                | string     | null: false       |
| discription                         | text       | null: false       |
| category                            | integer    | null: false       |
| condition                           | integer    | null: false       |
| postage_payer                       | integer    | null: false       |
| prefecture                          | integer    | null: false       |
| handing_time                        | integer    | null: false       |
| price                               | integer    | null: false       |
| user                                | references |
         


### Association

- has_one :purchases
- belongs_to :user


## purchases table

| Column      | Type       | Options                        |
|-------------|------------|-------------------             |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user

## addresses table


| Column             | Type                | Options                        |
|--------------------|---------------------|-------------------------       |
| post_code          | string              | null: false                    |
| city               | string              | null: false                    |
| building_name      | string              |                                |
| phone_number       | string              | null: false                    |
| purchase           | references          | null: false, foreign_key: true |


### Association
- has_one :purchases