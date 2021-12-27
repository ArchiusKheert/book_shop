class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order



  protected

  def afrer_sign_in_path_for(resource)
    if cookies[:from_checkout]
      cookies.delete :from_checkout
      checkout_path(:addresses)
    else
      super
    end
  end
=begin
  def after_sign_in_path_for(resource)
    if request.env['omniauth.origin']
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    else
      sign_in_url = new_user_session_url
      if request.referer == sign_in_url
        super
      else
        stored_location_for(resource) || request.referer || root_path
      end
    end
  end

  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
=end

  private


  def current_order
    return Order.new unless session[:order_id]
    Order.find(session[:order_id])
  end
end


