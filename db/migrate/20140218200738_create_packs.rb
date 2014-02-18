class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.references :user
      t.string :pack_type
      t.integer :quantity
      t.integer :status 
      t.timestamps
    end
  end
end
