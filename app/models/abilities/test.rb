module Abilities
	class Test
	  include CanCan::Ability

	  def initialize(user)
	    cannot :destroy, User
	  end
	end
end