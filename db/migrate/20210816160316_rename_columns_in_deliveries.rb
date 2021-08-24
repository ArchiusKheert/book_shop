class RenameColumnsInDeliveries < ActiveRecord::Migration[6.1]
  def change
    rename_column :deliveries, :method, :name
    rename_column :deliveries, :days, :time
  end
end
