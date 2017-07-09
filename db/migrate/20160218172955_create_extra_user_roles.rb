class CreateExtraUserRoles < ActiveRecord::Migration[4.2]
  def up
    Role.create name: :admin unless Role.find_by_name(:admin)
    Role.create name: :operator unless Role.find_by_name(:operator)
  end

  def down
  end
end
