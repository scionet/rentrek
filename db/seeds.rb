# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def seed_categories
  puts 'Cleaning categories...'
  puts "__________________"
  Category.destroy_all

  categories = ["Bikes & Cycling", "Backyard", "Boating & Paddle", "Fishing", "Hunting", "Camping & Hiking", "Climbing", "Yard Games", "Indoor Games", "Skates & Scooters", "Test"]

  puts 'Populating Categories...'
  puts "__________________"
  categories.each do |category|
    Category.create(name:category)
  end

  puts 'Categories generated!'
  puts "__________________"
end

def seed_equipment
  puts 'Cleaning database...'
  puts "__________________"
  Equipment.destroy_all
  User.destroy_all

  user1 = User.create(email: "johndoe@email.com", password: "fakeuser")
  user2 = User.create(email: "janedoe@email.com", password: "fakeuser")
  category = Category.create!(name: "Test")

  puts "Generating equipment for 2 test users..."
  puts "__________________"
  Equipment.create!(name: "Coleman Camping Tent", user_id: user1.id, category: category)
  Equipment.create!(name: "Full Suspension Mountain Bikes", user_id: user1.id, category: category)
  Equipment.create!(name: "Inflatable Kayaks - Single", user_id: user1.id, category: category)
  Equipment.create!(name: "Snowshoes - Kids", user_id: user2.id, category: category)
  Equipment.create!(name: "Snowboard - Adult", user_id: user2.id, category: category)
  puts "Equipment Generated!"
end

seed_categories
seed_equipment
