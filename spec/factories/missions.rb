FactoryBot.define do
  factory :mission do
    user { User.first }
    title { Faker::Name.name }
  end
end
