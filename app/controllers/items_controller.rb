class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only:[:show,:edit,:update]
  
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

  def show
  end

  def edit
    unless current_user.id == @item.user_id
      render action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :title, :introduction, :category_id, :condition_id, :shipping_charge_id, :shipping_prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
end
