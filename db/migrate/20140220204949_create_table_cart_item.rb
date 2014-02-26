class CreateTableCartItem < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.shopping_cart_item_fields
      t.timestamps
    end

    add_index :cart_items , [:owner_type ,:owner_id]
  end
end
