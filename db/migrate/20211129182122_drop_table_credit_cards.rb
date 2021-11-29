class DropTableCreditCards < ActiveRecord::Migration[6.1]
  def change
    drop_table :credit_cards
  end
end
