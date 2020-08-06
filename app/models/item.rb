class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  has_one  :purchase, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, inclusion: { in: (300..9_999_999) }
end
