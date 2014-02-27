class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users , :invite_code, :string
  	add_column :users , :credit , :float , default: 0 , null: false
  	add_column :users , :invited_by_id , :integer
  end
end
