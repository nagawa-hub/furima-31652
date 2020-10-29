FactoryBot.define do
  factory :item do
    title { 'sample' }
    introduction { 'これはサンプルです。' }
    category_id { '2' }
    condition_id { '2' }
    shipping_charge_id { '2' }
    shipping_prefecture_id { '2' }
    shipping_day_id { '2' }
    price { '3000' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
