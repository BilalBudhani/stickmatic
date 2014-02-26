class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items do |t|
      t.references :product
      t.string :instagram_image_id, null: false
      t.string :instagram_image_url , length: 500, null: false
      t.string :instagram_image_thumb_url , length: 500, null: false
      t.timestamps
    end

    add_index :product_items ,:product_id

  end
end
