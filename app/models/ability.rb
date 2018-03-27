# require 'ability_admin'

class Ability
  include CanCan::Ability

  def initialize(user)
    if (user)
      if (user.has_role? :admin)
        merge Abilities::Admin.new(user) 
        merge Abilities::Test.new(user) 
      end
   
      can [:index, :mark_read, :mark_all_read], Notification, user_id: user.id

    end
  end
end