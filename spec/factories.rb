FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    username { Faker::Internet.username }
    password { Faker::Internet.password }
    email { Faker::Internet.email }
  end
end

FactoryBot.define do
  factory :twat do
    twat { Faker::Quote.famous_last_words }
    user
  end
end

FactoryBot.define do
  factory :retwat do
    twat
    user
  end
end

FactoryBot.define do
  factory :like do
    twat
    user
  end
end

FactoryBot.define do
  factory :comment do
    body { Faker::Quotes::Shakespeare.hamlet_quote }
    twat
  end
end


