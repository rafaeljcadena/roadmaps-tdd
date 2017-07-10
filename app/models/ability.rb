class Ability
  include CanCan::Ability

  def initialize(user)
    if (user)
      if (user.has_role? :admin)
        can :manage, :all
        cannot :manage, Notification
        cannot :destroy, User
      end
      can [:index, :mark_read, :mark_all_read], Notification, user_id: user.id
      # if (user.has_role? :another_role)

      # end
    end
  end
end
