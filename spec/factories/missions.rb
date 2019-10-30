FactoryBot.define do
  factory :mission do
    association :user
    title { Faker::Name.name }
    priority { %w(urgent common low ).sample }
    category { %w(company home ).sample }
    start_time { Time.now }
  end
end
