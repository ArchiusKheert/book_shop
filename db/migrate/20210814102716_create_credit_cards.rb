class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :name_on_card
      t.string :month
      t.string :year
      t.string :cvv

      t.timestamps
    end
  end
end