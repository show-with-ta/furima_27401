FactoryBot.define do
  factory :item do
    name                          { 'ネシア語' }
    detail                  { 'terimakasih' }
    category_id                   { '2' }
    condition_id             { '2' }
    postage_payer_id              { '2' }
    prefecture_id            { '2' }
    shipping_day_id            { '2' }
    price                         { '1000' }
    user_id                       { '2' }

    association :user
    after(:build) { |item| item.image.attach(io: File.open('spec/fixtures/スクリーンショット.png'), filename: 'スクリーンショット.png', content_type: 'image/png') }
  end
end