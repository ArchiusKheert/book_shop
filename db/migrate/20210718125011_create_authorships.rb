class CreateAuthorships < ActiveRecord::Migration[6.1]
  def change
    create_table :authorships do |t|
      t.belongs_to :author, null: false, foreign_key: true
      t.belongs_to :book, null: false, foreign_key: true

    end

    add_index :authorships, [:author_id,:book_id]
  end
end
