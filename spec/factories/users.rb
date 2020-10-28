FactoryBot.define do
  factory :user do
    nickname    { 'abe' }
    email       { Faker::Internet.free_email }
    password    { 'abc123' }
    password_confirmation { password }
    last_name   { '高橋' }
    first_name  { '純一' }
    last_kana   { 'タカハシ' }
    first_kana  { 'ジュンイチ' }
    birthday { '1998/10/22' }
  end
end
