class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.integer :price
      t.timestamps
    end
  end
end
