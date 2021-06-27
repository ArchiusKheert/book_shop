class AddOmniauthColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :provider, :string, default: 'email'
    add_column :users, :uid, :string
  end
end
