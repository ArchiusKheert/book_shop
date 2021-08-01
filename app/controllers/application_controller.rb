class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order

  private


  def current_order
    return current_user.orders.in_progress.last || Order.new if user_signed_in?

    if session[:order_id].nil?
      Order.new
    else
      Order.find(session[:order_id]) || Order.new
    end
  end

end
