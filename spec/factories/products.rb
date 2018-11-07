# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  nome        :string
#  price       :float
#  status      :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :product do
    nome { Faker::Commerce.material }
    price 1.5
    # category
  end
end
