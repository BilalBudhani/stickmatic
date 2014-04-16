class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :add1
      t.string :add2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :mobile
      t.string :landmark
      t.references :order, index: true

      t.timestamps
    end
  end
end
