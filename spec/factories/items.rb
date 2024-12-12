require 'faker'

FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    info { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: StringIO.new('dummy image'),
                        filename: 'test_image.png',
                        content_type: 'image/png')
    end
  end
end
