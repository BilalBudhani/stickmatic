class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :street , null: false
      t.string :city , null: false
      t.string :state
      t.string :pincode, null: false
      t.string :country, null: false
      t.timestamps
    end
  end
end
