class RemoveQuantityFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :quantity, :integer
  end
end
