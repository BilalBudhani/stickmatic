class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_type, null: false
      t.timestamps
    end

    add_index :products ,:product_type

  end
end
