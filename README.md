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
| first_name_kana    | string              | null: false             |
| birth_date         | date                | null: false             |



### Association

* has_many :items
* has_many :purchases

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| discription                         | text       | null: false       |
| category_id                         | integer    | null: false       |
| condition_id                        | integer    | null: false       |
| postage_payer_id                    | integer    | null: false       |
| prefecture_id                       | integer    | null: false       |
| handing_time_id                     | integer    | null: false       |
| price                               | integer    | null: false       |
| user                                | references |                   |
         


### Association

- has_one :purchase
- belongs_to :user


## purchases table

| Column      | Type       | Options                        |
|-------------|------------|-------------------             |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user

## addresses table


| Column             | Type                | Options                        |
|--------------------|---------------------|-------------------------       |
| post_code          | string              | null: false                    |
| prefectures        | string              | null: false　　　　　　　　　　　　|
| city               | string              | null: false                    |
| address            | string              | null: false                    |
| building_name      | string              |                                |
| phone_number       | string              | null: false                    |
| purchase           | references          | null: false, foreign_key: true |


### Association
- has_one :purchase