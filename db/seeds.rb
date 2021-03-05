# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_equipment
  puts 'Cleaning database...'
  Equipment.delete_all

  user = User.new(email: "sam@samlim.com", password: "password123")
  category = Category.new(name: "Outdoor Equipment")

  user.save
  category.save

  Equipment.create!(name: "Coleman Camping Tent", user_id: user.id, category_id: category.id)
  Equipment.create!(name: "Full Suspension Mountain Bikes", user_id: user.id, category_id: category.id)
  Equipment.create!(name: "Inflatable Kayaks - Single", user_id: user.id, category_id: category.id)
  Equipment.create!(name: "Snowshoes - Kids", user_id: user.id, category_id: category.id)
  Equipment.create!(name: "Snowboard - Adult", user_id: user.id, category_id: category.id)
  puts Equipment.all
end
return seed_equipment
