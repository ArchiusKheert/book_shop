class CheckoutWController < ApplicationController
  include Wicked::Wizard

  steps :login, :address, :delivery, :payment, :confirm, :complete

  def show
    @user = current_user
    case step
    when :login
      skip_step if current_user
    when :address

    end

    render_wizard
  end
end
