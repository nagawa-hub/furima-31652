FactoryBot.define do
  factory :item_order do
    token { 'tok_abcdefghijk00000000000000000' }
    post_number { '123-1234' }
    home_prefecture_id { 2 }
    home_town { '大阪市' }
    home_address { '大阪1-1-12' }
    building { '大阪' }
    phone_number { '12312345678' }
  end
end
