# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Yacht.destroy_all
Booking.destroy_all

7.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8))


  2.times do
    Yacht.create!(name: Faker::StarWars.vehicle, location: ["Marseille", "Tel Aviv", "New York", "Miami", "Los Angeles", "Sydney"].sample, boat_type: ["Houseboat", "Catamaran", "Sailboat", "Speedboat", "Motor boat"].sample, user: user)
  end
end

10.times do
start = (Date.today..3.months.from_now.to_date).to_a.sample
Booking.create!(
  user: User.all.sample,
  yacht: Yacht.all.sample,
  start_date: start,
  end_date: start + rand(10).days
  )
end


4.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8))
end








