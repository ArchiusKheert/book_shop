class DropTableShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    drop_table :shipping_addresses
  end
end
