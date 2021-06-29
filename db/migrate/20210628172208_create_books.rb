class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.decimal :price, precision: 5, scale: 2
      t.integer :quantity
      t.text :description
      t.decimal :height, precision: 4, scale: 2
      t.decimal :width, precision: 4, scale: 2
      t.decimal :depth, precision: 4, scale: 2
      t.integer :year_of_publication
      t.string :materials

      t.timestamps
    end
  end
end
