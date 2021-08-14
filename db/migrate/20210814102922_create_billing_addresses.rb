class CreateBillingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :billing_addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :country
      t.string :zip
      t.string :phone

      t.timestamps
    end
  end
end