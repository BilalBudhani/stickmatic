class CreatePackItems < ActiveRecord::Migration
  def change
    create_table :pack_items do |t|
      t.references :pack
      t.string :instagram_image_id
      t.string :instagram_image_url , length: 500
      t.timestamps
    end
  end
end
