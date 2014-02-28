class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :transaction_id , null: false
      t.string :action, null: false, default: 'pending'
      t.string :message
      t.references :address, null: false
      t.references :user, null: false
      t.timestamps
    end

    add_index :orders ,:user_id
    add_index :orders ,:address_id
    add_index :orders ,:transaction_id
  end
end
