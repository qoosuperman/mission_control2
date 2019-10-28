FactoryBot.define do
  factory :mission do
    association :user
    title { Faker::Name.name }
  end
end
