# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

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
  "Flower girl/boy" => ["https://images.unsplash.com/photo-1515563562861-4d2514edb3e3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80", "I'm just a widdle kid wooking to bwighten up any big person's wedding day!"],
  "Priest" => ["https://images.unsplash.com/photo-1508326373793-4ec155eefa8e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80", "Fully licensed and well prepared to assist you on your wedding day. I can make attempts at humour if requested, or just stick to the script."],
  "Best man" => ["https://images.unsplash.com/photo-1621510007869-775c2657e580?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80", "Bros tell me all the time I'm an absolute legend at weddings. Not that I ever remember."],
  "Bridesmaid" => ["https://images.unsplash.com/photo-1511145822182-677fa5800671?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=869&q=80", "I'll be there to support you like sisters no matter what! I also promise I won't try to upstage you in anyway."],
  "Drunk Uncle" => ["https://images.unsplash.com/photo-1541020230467-e33e4f96f7fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80", "Every uncle needs a drunk wedding. I have over 30 years of experience and I'll surely give you a day to remember."],
  "Grandpa" => ["https://images.unsplash.com/photo-1542803293-cde7da05c348?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=892&q=80", "I'll talk to every guest at the wedding and tell them all sorts of stories about when you were a kid. Can cry on command."],
  "Grandma" => ["https://images.unsplash.com/photo-1442458370899-ae20e367c5d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80", "I'll tell everyone at the wedding how I can't believe how big you've gotten and how very proud of you I am."],
  "Charioteer" => ["https://images.unsplash.com/photo-1527580477540-6ef8bc65b8a3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80", "I'll take you to wherever, or from wherever you want. Horse incldued."],
  "General guest" => ["https://plus.unsplash.com/premium_photo-1661315495452-12a4459e3c13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80", "I'll tell everyone how radiant you look, how amazing the day is for a wedding, laugh at your speech. Whatever you need." ]
}

puts "Creating 20 new Jobs and bookings"
20.times do
  job = Job.create!(name: names.sample, price: rand(5...10)*1000, location: locations.sample, user: users.sample, description: "This is a default description!")
  customer = users.sample.id
  while  customer == job.user_id
    customer = users.sample.id  
  end
  booking = Booking.create!(date: Date.today, job_id: job.id, user_id: customer)
  file = URI.open(job_details[job.name][0])
  # job.image = job_details[job.name][0]
  job.photo.attach(io: file, filename: "jobphoto.jpg", content_type: "image/png")
  job.description = job_details[job.name][1]
  job.save!
  puts "create #{job.name} adv"
  puts "create #{booking.id}"
end

puts "Done"
