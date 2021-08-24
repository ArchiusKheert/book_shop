class AddDeliveryRefToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :delivery, null: false, foreign_key: true
  end
end
