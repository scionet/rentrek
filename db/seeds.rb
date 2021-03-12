# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "pry"
def serialize_image(img_url)
  file = URI.open(img_url)
end

def user_avatar

end

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
  file = URI.open("https://images.unsplash.com/photo-1611839798768-c0c067613571?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80")
  user1.avatar.attach(io: file, filename: "user1_avatar.png", content_type: 'image/png')

  user2 = User.create(email: "janedoe@email.com", password: "fakeuser")
  file = URI.open("https://images.unsplash.com/photo-1609543232540-7d1af3591c20?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1707&q=80")
  user2.avatar.attach(io: file, filename: "user2_avatar.png", content_type: 'image/png')

# binding.pry

  category = Category.create!(name: "Test")

  prng = Random.new
  random_description = Faker::Lorem.paragraph(sentence_count: prng.rand(2..4))
  random_price_per_day = prng.rand(6..40)

  puts "Generating equipment for 2 test users..."
  puts "__________________"

  
  Equipment.create!(
    name: "Kites FUELs 11m. et 9m. 2018",
    description: random_description,
     user_id: user1.id,
     category: category,
     price_per_day: 30,
     location: "Montreal, Qc",
     photos: this.photos.attach(
       io: URI.open("https://images.unsplash.com/photo-1609543232540-7d1af3591c20?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1707&q=80"),
       filename: "thumnail.png", 
       content_type: 'image/png')
    )
    puts "first equipment PASSED"
  Equipment.create!(
    name: "Full Suspension Mountain Bikes",
    description: random_description,
     user_id: user1.id,
     category: category,
     price_per_day: random_price_per_day,
     location: "Montreal, Qc"
    )
  Equipment.create!(
    name: "Inflatable Kayaks - Single",
    description: random_description,
     user_id: user1.id,
     category: category,
     price_per_day: random_price_per_day,
     location: "Montreal, Qc"
    )
  Equipment.create!(
    name: "Snowshoes - Kids",
    description: random_description,
     user_id: user2.id,
     category: category,
     price_per_day: random_price_per_day,
     location: "Montreal, Qc"
    )
  Equipment.create!(
    name: "Snowboard - Adult",
    description: random_description,
     user_id: user2.id,
     category: category,
     price_per_day: random_price_per_day,
     location: "Montreal, Qc"
    )
  puts "Equipment Generated!"
end


seed_categories
seed_equipment
