# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Seeding Users"
user1 = User.new(username: "Boby", email: "bob@bob.com", password:"123456", password_confirmation: "123456", description: "Good at tennis", gender:"Male")
user1.save
puts "Seeding done congrats, #{User.count} users created !"

activity1 = Activity.new(title: "5 a side", start_time: "8pm", end_time:"10pm", player_limit: "10", location: "Hayarkon Park, Tlv", skill_level: "Beginner", description:" Become the new Messi", sport_id: 1, user_id: 1)
activity1.save
puts "Seeding done congrats, #{Activity.count} activities created !"
