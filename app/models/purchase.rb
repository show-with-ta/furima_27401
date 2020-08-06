class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item, optional: true
  belongs_to_active_hash :prefecture
  
  VALID_POSTCODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  VALID_PHONENUMBER_REGEX = /\A\d{,11}\z/.freeze
  
  with_options presence: true do
    validates :post_code, format: { with: VALID_POSTCODE_REGEX, message: '郵便番号にはハイフンが必要です。' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: VALID_PHONENUMBER_REGEX, message: '電話番号にはハイフンは不要で11桁以内です。' }
  end
  
end
