class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :discription
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handing_time_id
    validates :price, numericality: { with: /\A[0-9]+\z/ }
    validates :image
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :handing_time_id
  end
  validates :price, numericality: { greater_than: 299 }
  validates :price, numericality: { less_than: 10_000_000 }

  has_one :purchase
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handing_time
end
