require 'rails_helper'

RSpec.describe User, type: :model do
  

	context 'Validations' do
		# Presence
  	it { is_expected.to validate_presence_of(:email) }	
  	it { is_expected.to validate_presence_of(:name) }	

  	# Length
	  it { is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(80) }
	  
  end
end