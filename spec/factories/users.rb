FactoryBot.define do
	factory :user, aliases: [:user_admin_default] do
		# Personal Info
		# avatar {File.new("#{Rails.root}/app/assets/images/email_img.png")}
		name { Faker::Name.name }
		email { Faker::Internet.email  }
		password 'lklklklk'
		password_confirmation { password }
		# cnpj { Faker::CNPJ.numeric }
	end
end