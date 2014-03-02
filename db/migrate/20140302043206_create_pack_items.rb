class CreatePackItems < ActiveRecord::Migration
  def change
    create_table :pack_items do |t|
      t.string :image
      t.string :thumb
      t.string :uid
      t.belongs_to :pack, index: true

      t.timestamps
    end
  end
end
