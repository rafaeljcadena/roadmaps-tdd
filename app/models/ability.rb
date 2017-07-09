class Ability
  include CanCan::Ability

  def initialize(user)
    if (user)
      if (user.has_role? :admin)
        can :manage, :all
        cannot :destroy, User
      end
      # if (user.has_role? :another_role)

      # end
    end
  end
end
