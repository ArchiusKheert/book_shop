class Checkout::AddressController < ApplicationController

  def edit
    @form = AddressForm.new(current_order)
  end

  def update
    @form = AddressForm.new(current_order)
    next_step if @form.valid?

  end

  def working_with_object
    return render :edit unless @form.validate(params[controller_name.to_sym])
    @form.save
  end

  def checkout_flow
    current_order.next_step! unless current_order.confirm? || current_order.complete?
  end

  def same_address
    current_order.use_same_address
  end
end