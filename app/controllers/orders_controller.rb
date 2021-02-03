class OrdersController < ApplicationController
  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    @order.save
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecure_id, :municipality, :fandee, :bill, :phone_number)
  end
end
