require 'ability_admin'
require 'ability_test'

class Ability::Factory
  def self.build(user)

    if (user.has_role? :admin)
        # return Ability::Admin.new(user).merge(Ability::Test.new(user))
        return Ability::Test.new(user).merge(Ability::Admin.new(user))
        # return Proc.new {  }
    end
  end
end