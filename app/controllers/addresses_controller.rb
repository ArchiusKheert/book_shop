class AddressesController < ApplicationController
  def index
    @addresses = AddressForm.new(user_id :current_user.id)
  end

  def create
    @addresses = AddressForm.new(addresses_params)
    status = @addresses.save ? :create : :found
    render :index, object: @addresses.errors
  end

  private

  def addresses_params
    params.require(:addresses_form)
  end
end
