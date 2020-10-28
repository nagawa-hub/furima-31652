class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_prefecture_id
    validates :shipping_day_id
    validates :price
  end
    
  belongs_to :user
  has_one_attached :image
  
end
