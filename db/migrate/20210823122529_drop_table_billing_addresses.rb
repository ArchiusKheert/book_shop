class DropTableBillingAddresses < ActiveRecord::Migration[6.1]
  def change
    drop_table :billing_addresses
  end
end
