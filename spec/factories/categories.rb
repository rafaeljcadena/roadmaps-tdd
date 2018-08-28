FactoryBot.define do
  factory :category do
    name { Faker::Company.profession }
  end
end
