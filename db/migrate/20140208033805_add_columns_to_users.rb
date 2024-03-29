class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :username, :string
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :token, :string

    add_index :users, :uid
  end
end
