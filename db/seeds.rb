# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
# debugging
require "pry"
# scraping
require 'nokogiri'






def seed_categories_enhanced
  puts 'Cleaning categories...'
  puts "__________________"
  Category.destroy_all
  @categories = []
  @outdoorsgeek = {
    url: "https://www.outdoorsgeek.com/rent-it/",
    selector: "div.et_pb_section:nth-child(3) h3"
  }
  def scraping_categories(url, selector)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    
    html_doc.search(selector).each do |element|
      puts element.text.strip
      @categories << element.text.strip
    end
    @categories.uniq!
    @categories.pop
  end
  
  scraping_categories(@outdoorsgeek[:url], @outdoorsgeek[:selector])
  p @categories.length
  
  # categories = ["Bikes & Cycling", "Backyard", "Boating & Paddle", "Fishing", "Hunting", "Camping & Hiking", "Climbing", "Yard Games", "Indoor Games", "Skates & Scooters", "Test"]
  
  puts 'Populating Categories...'
  puts "__________________"
  @categories.each do |category|
    Category.create(name:category)
  end
  binding.pry
  puts 'Categories generated!'
  puts "__________________"
end

# 

# binding.pry





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





def serialize_image(img_url)
  file = URI.open(img_url)
end

def user_avatar
  
end







def seed_equipment
  puts 'Cleaning database...'
  puts "__________________"
  Equipment.destroy_all
  User.destroy_all
  
  user1 = User.create(email: "johndoe@email.com", password: "fakeuser")
  file = URI.open("https://picsum.photos/200/300")
  user1.avatar.attach(io: file, filename: "user1_avatar.png", content_type: 'image/png')
  
  user2 = User.create(email: "janedoe@email.com", password: "fakeuser")
  file = URI.open("https://picsum.photos/200/300")
  user2.avatar.attach(io: file, filename: "user2_avatar.png", content_type: 'image/png')
  
  prng = Random.new
  random_title = Faker::Lorem.sentence
  random_description = Faker::Lorem.paragraph(sentence_count: prng.rand(2..4))
  random_price_per_day = prng.rand(6..40)
  
  puts "Generating equipment for 2 test users..."
  puts "__________________"
  
  
  e = Equipment.create(
    name: "Kites FUELs 11m. et 9m. 2018",
    description: random_description,
    user_id: user1.id,
    category: Category.order(Arel.sql('RANDOM()')).first,
    price_per_day: 30,
    location: "Montreal, Qc"
  )
  # binding.pry
  
  e.photos.attach( io: URI.open("https://picsum.photos/200/300"), filename: "thumnail.png",  content_type: 'image/png')
  e.save
  # binding.pry
  10.times do |e|
    e =  Equipment.create(
      name: random_title,
      description: random_description,
      user_id: user1.id,
      category: Category.order(Arel.sql('RANDOM()')).first,
      price_per_day: random_price_per_day,
      location: "Montreal, Qc"
    )
    e.photos.attach( io: URI.open("https://picsum.photos/200/300"), filename: "thumnail.png",  content_type: 'image/png')
    e.save
    
    puts "#{e.name} created"
    
  end
  puts "Equipment Generated!"
end


# seed_categories

# seed_categories_enhanced
seed_equipment
