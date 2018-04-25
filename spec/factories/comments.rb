# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  commenteable_id   :integer
#  commenteable_type :string
#  user_id           :integer
#  text              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :comment do
    text { Faker::Text.text }
		user
		commenteable { user }
  end
end
