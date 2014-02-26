class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items do |t|
      t.references :product
      t.string :instagram_image_id
      t.string :instagram_image_url , length: 500
      t.timestamps
    end

    add_index :product_items ,:product_id

  end
end
