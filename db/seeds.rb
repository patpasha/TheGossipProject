# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

nb_user = 10
nb_cities = 6
nb_de_gossip = 20
nb_tag = 20
nb_comment = 12

nb_user.times do
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movie.quote, email: Faker::Internet.email, age: Faker::Number.number(2))
end


nb_cities.times do
	City.create(name: Faker::Name.first_name, postal_code: Faker::Address.zip_code)
end


nb_de_gossip.times do
	Gossip.create(title: Faker::Pokemon.name, content: Faker::Movie.quote, date: Faker::Time.between(DateTime.now - 1, DateTime.now), user_id: rand(User.first.id..User.last.id))
end


nb_de_gossip.times do |i|
	Tag.create(gossip_id: (i+1), title: Faker::Pokemon.name)
end


id_recipient = rand(User.first.id..User.last.id)
begin
	id_sender = rand(User.first.id..User.last.id)
end while(id_sender==id_recipient)
	Pm.create(content: Faker::Movie.quote, date: Faker::Time.between(DateTime.now - 1, DateTime.now), recipient_id: id_recipient, sender_id: id_sender)


nb_comment.times do
	Comment.create!(user_id: rand(User.first.id..User.last.id), gossip_id: rand(Gossip.first.id..Gossip.last.id), content: Faker::Movie.quote)
end


20.times do
 Like.create(like: Faker::Boolean.boolean)
end
