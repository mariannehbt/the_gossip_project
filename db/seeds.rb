# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Création de 100 City avec Faker
require 'faker'
10.times do
  city = City.create!(city_name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

# Création de 10 User avec Faker
require 'faker'
10.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Subscription.status, email: Faker::Internet.email, age: rand(15..60), city_id: City.all.sample.id)
end

# Création de 20 Gossip avec Faker
20.times do
  gossip = Gossip.create!(title: Faker::Verb.past_participle, content: Faker::Quote.yoda, user_id: User.all.sample.id)
end

# Création de 10 Tag avec Flaker
10.times do
  tag = Tag.create!(title: Faker::Cannabis.buzzword)
end

# Ajout d'au minimum un Tag par Gossip
Gossip.all.each do |gossip|
  tags = Tag.all.sample(rand(1..5))
  tags.each do |tag|
    JoinTableGossipTag.create!(gossip_id: gossip.id, tag_id: tag.id)
  end
end

# Creation de 10 PM avec Faker
10.times do
  nb_receiver = User.all.sample(rand(1...5))
  pm = PrivateMessage.create!(recipient_id: nb_receiver.id, sender_id: User.all.sample.id, content: Faker::Quote.yoda)
end
