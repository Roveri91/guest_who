# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying all the Bookings"
Booking.delete_all

puts "Destroying all the JOBS ADV"
Job.delete_all


puts "Destroying all the USERS"
User.delete_all

users = []
puts "Creating new Fabolous Users"

user = User.create!(first_name: "Giulia", last_name: "Menin", email: "GiuliaMenin@gmail.com", password: "123456")
users << user
puts "created #{user.first_name} user"

user = User.create!(first_name: "Tenny", last_name: "Ma", email: "TennyMa@gmail.com", password: "123456")
users << user
puts "created #{user.first_name} user"

user = User.create!(first_name: "Jonny", last_name: "Smith", email: "JonnySmith@gmail.com", password: "123456")
users << user
puts "created #{user.first_name} user"

user = User.create!(first_name: "Simone", last_name: "Roveri", email: "SimoneRoveri@gmail.com", password: "123456")
users << user
puts "created #{user.first_name} user"


names = ["Flower girl/boy", "Priest", "Best man", "Bridesmaid", "Drunk Uncle", "Grandpa", "Grandma", "Charioteer", "General guest"]
locations = ["Tokyo", "Osaka", "Hiroshima", "Kyoto", "Kobe", "Kanazawa", "Sapporo", "Naha", "Nagasaki", "Amami"]

puts "Creating 20 new Jobs and bookings"
20.times do
  job = Job.create!(name: names.sample, price: rand(5...10)*1000, location: locations.sample, description: Faker::Lorem.sentences(number: 3), user: users.sample)
  booking = Booking.create!(date: Date.today, job_id: job.id, user_id: users.sample.id, status: [0..2].sample)
  if (job.name == "Flower girl/boy")
    job.image = "flower_girl.jpg"
  elsif job.name == "Priest"
    job.image = "priest_image.jpg"
  elsif job.name == "Best man"
    job.image = "best_man.jpg"
  elsif job.name == "Bridesmaid"
    job.image = "bridesmaid.webp"
  elsif job.name == "Drunk Uncle"
    job.image = "drunk_uncle.jpg"
  elsif job.name == "Grandpa"
    job.image = "wedding_grandpa.jpg"
  elsif job.name == "Grandma"
    job.image = "wedding_grandma.jpg"
  elsif job.name == "Charioteer"
    job.image = "charioteer.jpg"
  else
    job.image = "wedding_guest.jpg"
  end
  job.save!
  puts "create #{job.name} adv"
  puts "create #{booking.id}"
end

puts "Done"
