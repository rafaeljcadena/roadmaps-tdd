class AddExtraFieldsToUser < ActiveRecord::Migration[4.2]
  def change
  	add_column :users, :name, :string
  	# add_column :users, :phone, :string
  	# add_column :users, :customer_id, :integer
  	# add_index :users, :customer_id
  end
end
