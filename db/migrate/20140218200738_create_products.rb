class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user
      t.integer :product_type, null: false
      t.integer :quantity, default: 1, null: false
      t.integer :status, null: false
      t.timestamps
    end

    add_index :products ,:user_id
    add_index :products ,[:user_id,:product_type]
    add_index :products ,[:user_id,:product_type,:status]

  end
end
