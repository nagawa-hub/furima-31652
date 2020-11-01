class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
    if Order.where(item_id: @item.id).exists?
      @items = Item.includes(:user).order('created_at DESC')
      render template: 'items/index'
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def item_order_params
    params.require(:item_order).permit(:post_number, :home_prefecture_id, :home_town, :home_address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, price: @item.price, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item_order_params[:price],
      card: item_order_params[:token],
      currency: 'jpy'
    )
  end
end
