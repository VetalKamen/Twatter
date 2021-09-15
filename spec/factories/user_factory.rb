FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
  end
end