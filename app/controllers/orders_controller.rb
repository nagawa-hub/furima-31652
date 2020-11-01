class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private
  def item_order_params
    params.require(:item_order).permit(:post_number,:home_prefecture_id,:home_town,:home_address,:building,:phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end

