class AddIsActiveToUsers < ActiveRecord::Migration[4.2]
  def up
    add_column :users, :is_active, :boolean
    User.update_all is_active: true
  end

  def down
    remove_column :users, :is_active, :boolean
  end
end
