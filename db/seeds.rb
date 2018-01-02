# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



#seed with dumb data for development; change to more relatable data for demo
#
#

UserContact.destroy_all
Interaction.destroy_all
Note.destroy_all
Contact.destroy_all
User.destroy_all
Event.destroy_all

5.times do

  Contact.create(first_name: "Mr.", last_name: "Dude", initial_meet: "2010-12-12 00:00:01", organization: "Turing", relationship: "Friend")

  User.create(username: "friend", email: "dude@dude.com")

  User.first.contacts << Contact.first

  Note.create(content: "this was a fun interaction", date: "2000-12-12", contact_id: Contact.last.id)

  Event.create(title: "Demo Night", start_time: "2018-01-10 18:00:00")

end



10.times do
  Interaction.create!(date: "2018-1-10", location: "Turing School", event: "Demo Night", description: "killer", contact_id: rand(Contact.first.id..Contact.last.id))
  puts "Interactions should be seeding!"
end
