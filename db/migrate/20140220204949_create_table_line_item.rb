class CreateTableLineItem < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.shopping_cart_item_fields
      t.timestamps
    end

    add_index :line_items , [:owner_type ,:owner_id]
  end
end
