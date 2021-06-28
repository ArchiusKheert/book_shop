class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      t.integer :rating

      t.timestamps
    end
  end
end
