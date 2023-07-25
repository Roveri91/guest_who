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

job_details = {
  "Flower girl/boy" => ["flower_girl.jpg", "I'm just a widdle kid wooking to bwighten up any big person's wedding day!"],
  "Priest" => ["priest_image.jpg", "Fully licensed and well prepared to assist you on your wedding day. I can make attempts at humour if requested, or just stick to the script."],
  "Best man" => ["best_man.jpg", "Bros tell me all the time I'm an absolute legend at weddings. Not that I ever remember."],
  "Bridesmaid" => ["bridesmaid.webp", "I'll be there to support you like sisters no matter what! I also promise I won't try to upstage you in anyway."],
  "Drunk Uncle" => ["drunk_uncle.jpg", "Every uncle needs a drunk wedding. I have over 30 years of experience and I'll surely give you a day to remember."],
  "Grandpa" => ["wedding_grandpa.jpg", "I'll talk to every guest at the wedding and tell them all sorts of stories about when you were a kid. Can cry on command."],
  "Grandma" => ["wedding_grandma.jpg", "I'll tell everyone at the wedding how I can't believe how big you've gotten and how very proud of you I am."],
  "Charioteer" => ["charioteer.jpg", "I'll take you to wherever, or from wherever you want. Horse incldued."],
  "General guest" => ["wedding_guest.jpg", "I'll tell everyone how radiant you look, how amazing the day is for a wedding, laugh at your speech. Whatever you need." ]
}

puts "Creating 20 new Jobs and bookings"
20.times do
  job = Job.create!(name: names.sample, price: rand(5...10)*1000, location: locations.sample, user: users.sample)
  booking = Booking.create!(date: Date.today, job_id: job.id, user_id: users.sample.id)
  job.image = job_details[job.name][0]
  job.description = job_details[job.name][1]
  job.save!
  puts "create #{job.name} adv"
  puts "create #{booking.id}"
end

puts "Done"
