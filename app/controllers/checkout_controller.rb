class CheckoutController < ApplicationController
  include Wicked::Wizard

  steps :login, :address, :delivery, :payment, :confirm, :complete

  def show
    @user = current_user
    @order = current_order
    @billing_address = @order.build_billing_address
    @shipping_address = @order.build_shipping_address
    case step
    when :login
      skip_step if current_user
    when :address
      @form = AddressForm.new(@order)

    end

    render_wizard
  end


  def update
    @user = current_user
    @order = current_order
    @billing_address = @order.build_billing_address
    @shipping_address = @order.build_shipping_address
    @billing_address.update_attributes!(ba_params)

    render_wizard @billing_address && @shipping_address

  end

  def ba_params
    params.require(:address).permit(billing_address_attributes: [:first_name, :last_name, :address, :city, :country, :zip, :phone])
  end

  def sa_params
    params.require(:address).permit(shipping_address_attributes: [:first_name, :last_name, :address, :city, :country, :zip, :phone])
  end
end
