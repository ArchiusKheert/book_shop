class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
                          .where.not(status: 'in_progress')
                          .order('created_at desc')
  end

  def show
    @order = current_user.order.find(params[:id])
  end
end
