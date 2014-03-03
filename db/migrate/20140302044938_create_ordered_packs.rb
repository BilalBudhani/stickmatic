class CreateOrderedPacks < ActiveRecord::Migration
  def change
    create_table :ordered_packs do |t|
      t.belongs_to :order, index: true
      t.belongs_to :pack, index: true
      t.integer :qty, default: 0
      t.integer :total_price, default: 0
      t.timestamps
    end
  end
end
