class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_detail
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :item_fee
  belongs_to_active_hash :item_day

  
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

  with_options numericality: { other_than: 1 } 
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_prefecture_id
    validates :shipping_day_id
  end

  
    
  
end
