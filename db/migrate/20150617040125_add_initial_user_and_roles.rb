class AddInitialUserAndRoles < ActiveRecord::Migration
  def up
  	Role.create name: :admin unless Role.find_by_name(:admin)

    if (User.where(email: "crystian@roadmaps.com.br").count == 0)
      u = User.create(email: "crystian@roadmaps.com.br", password: "lklklklk", name: "Crystian Leão")
      u.add_role :admin
    end
  end

  def down
  end
end
