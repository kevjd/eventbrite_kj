# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy.all

#création users
10.times do
  User.create(email: Faker::Internet.email, 
  encrypted_password: Faker::Internet.password(min_length = 3, max_length = 6),
  description: Faker::ChuckNorris.fact,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name)
end

#création event 
10.times do 
  Event.create(start_date: Faker::Date.forward(days = 365),
  duration: rand(5..90),
  title: Faker::Book.title,
  description: Faker::ChuckNorris.fact,
  price: rand(1..100),
  location: "Rennes",
  user_id: User.all.sample.id)
end

#création participations
10.times do
  Attendance.create(stripe_customer_id: rand(1..1000),
  user_id: User.all.sample.id,
  event_id: Event.all.sample.id)
end
