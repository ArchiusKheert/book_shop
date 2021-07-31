class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :number
      t.string :status
      t.decimal :total, precision: 11, scale:  2
      t.timestamp :completed_at
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
