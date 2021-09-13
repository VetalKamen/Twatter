# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
# generate 20 users
(1..20).each do |id|
  User.create!(
    id: id,
    name: Faker::Name.last_name,
    username: Faker::Name.first_name,
    email: Faker::Internet.email,
    password: 'password'
  )
end
p "#{User.count} users has been generated"

# generate 100 twats
(1..100).each do |id|
  Twat.create!(
    id: id,
    twat: Faker::Lorem.sentence(word_count: 4, random_words_to_add: 5),
    user_id: rand(1..20)
  )
end
p "#{Twat.count} twats has been generated"

# generate likes
(1..700).each do |id|
  user_id = rand(1..20)
  twat_id = rand(1..100)
  user = User.find_by(id: user_id)
  twat = Twat.find_by(id: twat_id)

  next if user.nil? || twat.nil?
  next if twat.liked?(user)

  Like.create!(
    id: id,
    twat_id: twat_id,
    user_id: user_id
  )
end
p "#{Like.count} likes has been generated"

# generate retwats
(1..80).each do |id|
  user_id = rand(1..20)
  twat_id = rand(1..100)
  user = User.find_by(id: user_id)
  twat = Twat.find_by(id: twat_id)

  next if user.nil? || twat.nil?
  next if twat.retwatted?(user)

  Retwat.create!(
    id: id,
    twat_id: twat_id,
    user_id: user_id
  )
end
p "#{Retwat.count} retwats has been generated"

# generate 250 comments
(1..250).each do |id|
  Comment.create!(
    id: id,
    twat_id: rand(1..100),
    body: Faker::Lorem.sentence(word_count: 2, random_words_to_add: 2)
  )
end
p "#{Comment.count} comments has been generated"
