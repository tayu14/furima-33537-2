class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :set_message, only: [:show, :edit, :update]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
  def show
    
  end
  def new
    @items = Item.new
  end
  def edit
    if current_user.id != @item.user_id
    render :show
    end
   end
  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else
     render action: :edit
    end
  end
  def create
    @items = Item.new(item_params)
    if @items.save
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
