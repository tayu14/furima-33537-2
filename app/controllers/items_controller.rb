class ItemsController < ApplicationController
  def index
    @item = Item.all
  end
  def new
    @item = Item.new
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

  def item_params
    params.require(:item).permit(:goods_name,:goods_explanation,:category_id,:status_id,:prefecure_money_id,:prefecure_id,:scheduled_delivery_id,:price,:user)
  end
end
