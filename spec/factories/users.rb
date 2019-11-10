FactoryBot.define do
  factory :user do
    this_time_password = [*"a".."z"].sample(6).join

    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { this_time_password }
    password_confirmation { this_time_password }
  end
end