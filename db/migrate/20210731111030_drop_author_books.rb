class DropAuthorBooks < ActiveRecord::Migration[6.1]
  def change
    drop_table :author_books
  end
end
