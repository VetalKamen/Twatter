FactoryBot.define do
  factory :twat do
    twat { Faker::Quote.famous_last_words }
    user
  end
end