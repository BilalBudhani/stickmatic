class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user
      t.string :product_type
      t.integer :quantity
      t.integer :status
      t.timestamps
    end
  end
end
