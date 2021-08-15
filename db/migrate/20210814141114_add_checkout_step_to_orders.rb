class AddCheckoutStepToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :checkout_step, :string
  end
end
