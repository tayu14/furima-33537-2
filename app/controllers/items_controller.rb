class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :set_message, only: [:show, :edit, :update]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  def show
    
  end
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end
  def new
    @item = Item.new
  end
  def edit
    if current_user.id != @item.user_id
    redirect_to root_path
    end
   end
  def update
    if current_user.id == @item.user_id
    if @item.update(item_params)
      redirect_to item_path
    else
     render action: :edit
    end
  end
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  private

  def set_message
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:goods_name,:goods_explanation,:category_id,:status_id,:prefecure_money_id,:prefecure_id,:scheduled_delivery_id,:price,:image).merge(user_id: current_user.id)
  end
end
