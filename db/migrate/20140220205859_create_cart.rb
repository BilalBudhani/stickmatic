class CreateCart < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :status ,default: Cart::PENDING, null: false
      t.references :user
      t.timestamp
    end

    add_index :carts , :user_id
    add_index :carts , [:user_id,:status]
  end
end
