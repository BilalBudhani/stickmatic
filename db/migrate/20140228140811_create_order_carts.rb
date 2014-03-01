class CreateOrderCarts < ActiveRecord::Migration
  def change
    create_table :order_carts do |t|
      t.references :cart
      t.references :order
      t.timestamps
    end

    add_index :order_carts, :cart_id
    add_index :order_carts, :order_id
    add_index :order_carts, [:cart_id,:order_id]
  end
end
