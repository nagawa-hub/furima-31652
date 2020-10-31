class OrderAddress < ApplicationRecord
  belongs_to :order

  with_options presence:true do
    validates :post_number
    validates :home_prefecture_id
    validates :home_town
    validates :home_address
    validates :phone_number
  end

  validates :home_prefecture_id, numericality: { other_than: 1 }
end
