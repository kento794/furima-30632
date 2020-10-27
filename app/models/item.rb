class Item < ApplicationRecord
  validates :name, presence: true
  validates :discription, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_payer_id, presence: true
  validates :prefecture_id, presence: true
  validates :handing_time_id, presence: true
  validates :price, presence: true, numericality: { with: /\A[0-9]+\z/ }
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :postage_payer_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :handing_time_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than: 300 }
  validates :price, numericality: { less_than: 9_999_999 }

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
