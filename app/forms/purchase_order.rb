class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :token, :post_code, :prefecture_id, :city, :street_number, :building, :phone_number, :user_id, :item_id

  VALID_POSTCODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  VALID_PHONENUMBER_REGEX = /\A\d{,11}\z/.freeze

  with_options presence: true do
    validates :post_code, format: { with: VALID_POSTCODE_REGEX, message: '郵便番号にはハイフンが必要です。' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: VALID_PHONENUMBER_REGEX, message: '電話番号にはハイフンは不要で11桁以内です。' }
  end

  def save
    Purchase.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_number: street_number, building: building, phone_number: phone_number, item_id: item_id)
    Order.create(user_id: user_id, item_id: item_id)
  end
end