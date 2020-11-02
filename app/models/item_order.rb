class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :home_prefecture_id, :home_town, :home_address, :building, :phone_number, :price, :token

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :home_prefecture_id, numericality: { other_than: 1 }
    validates :home_town
    validates :home_address
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderAddress.create(post_number: post_number, home_prefecture_id: home_prefecture_id, home_town: home_town, home_address: home_address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
