class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_day

  with_options presence: true do
    validates :image
    validates :title
    validates :introduction
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_prefecture_id
    validates :shipping_day_id
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_prefecture_id
    validates :shipping_day_id
  end

  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
