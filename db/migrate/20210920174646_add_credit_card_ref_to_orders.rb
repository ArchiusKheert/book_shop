class AddCreditCardRefToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :credit_card, null: false, foreign_key: true
  end
end
