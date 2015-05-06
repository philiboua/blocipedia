# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
 
#Create Users
5.times do
  user = User.new(
    name:  Faker::Name.name,
    email:  Faker::Internet.email,
    password:  Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users=User.all

# Create Wikis
20.times do
  Wiki.create!(
    user: users.sample,
    title:        Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
   )
end
# Create an admin user
admin = User.new(
  name: "Admin User",
  email: "admin@example.com",
  password: "password",
  role: "admin"
  )
admin.skip_confirmation!
admin.save!

#Create a premium
premium = User.new(
  name: "Premium User",
  email: "premium@example.com",
  password: "password",
  role: "premium"
  )
premium.skip_confirmation!
premium.save!


puts "Seed finished"
puts "#{User.count} users created" 
puts "#{Wiki.count} wikis created"
