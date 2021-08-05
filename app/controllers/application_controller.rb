class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order

  private


  def current_order
    current_order ||=
      if session[:order_id]
        Order.find(session[:order_id])
      elsif user_signed_in?
        user_orders = current_user.orders.in_progress
        user_orders.empty? ? Order.new : user_orders.last
      else
        Order.new
      end
  end
end
