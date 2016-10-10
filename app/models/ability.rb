class Ability
  include CanCan::Ability

  def initialize(user)
    if (user)
      if (user.has_role? :admin)
        can :manage, :all
        cannot :destroy, User
      end
      if (user.has_role? :manager)

      end
      if (user.has_role? :editor)

      end
      if (user.has_role? :author)

      end
      if (user.has_role? :accountant)

      end


    end
  end
end
