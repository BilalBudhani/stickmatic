class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.integer :qty
      t.integer :total_price
      t.string :status
      t.string :remark
      t.boolean :paid

      t.timestamps
    end
  end
end
