class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :introduction, :category_id, :condition_id, :shipping_charge_id, :shipping_prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
