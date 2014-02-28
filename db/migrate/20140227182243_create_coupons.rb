class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.string :amount
      t.string :percent
      t.datetime :expires_at
      t.timestamps
    end
  end
end
