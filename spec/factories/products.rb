FactoryBot.define do
  factory :product do
    name { Faker::Company.type }
    price { Faker::Number.decimal(2) }
    status 'Pending'
    category
  end
end
