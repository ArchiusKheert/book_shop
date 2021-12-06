class CartsController < ApplicationController
  def show
    @order = Order.new(order_item_ids: session[:cart])
  end


end
