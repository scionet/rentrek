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





@fake_user = [
    {
        "name": "Sasha Ho",
        "email": "sasha.ho@gmail.com",
        "position": "Administrative Assistant",
        "photo": "https:\/\/images.pexels.com\/photos\/415829\/pexels-photo-415829.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb"
    },
    {
        "name": "Giselle Franks",
        "email": "giselle.franks@gmail.com",
        "position": "Marketing",
        "photo": "https:\/\/images.generated.photos\/aNQYYS0hAZyxZ0qlqKbI-bERqUBV36z8xUK5jacrLEs\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zLzA5\/OTk4ODIuanBn.jpg"
    },
    {
        "name": "Kent Sosa",
        "email": "kent.sosa@gmail.com",
        "position": "Administrative Assistant",
        "photo": "https:\/\/images.generated.photos\/z_w45-PQ28jY08f8O4BMykbnCVpwXsaoDvzoBgPYCg0\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zL3Yy\/XzA4MzYxMDIuanBn.jpg"
    },
    {
        "name": "Jenil Gogari",
        "email": "jenil.gogari@gmail.com",
        "position": "Senior Developer",
        "photo": "https:\/\/uifaces.co\/our-content\/donated\/xB857nIu.jpg"
    },
    {
        "name": "Amiya Potts",
        "email": "amiya.potts@gmail.com",
        "position": "Accounting",
        "photo": "https:\/\/images.unsplash.com\/photo-1548537412-08ab4040f199?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ"
    },
    {
        "name": "Adolfo Hess",
        "email": "adolfo.hess@gmail.com",
        "position": "Sales",
        "photo": "https:\/\/images.generated.photos\/0PjDpiMOeF-HXb2lvBkGiApuNNESjm1YlhAMlJVT6PQ\/rs:fit:512:512\/Z3M6Ly9nZW5lcmF0\/ZWQtcGhvdG9zL3Yy\/XzA4MTg2OTYuanBn.jpg"
    },
    {
        "name": "Alex Diwa",
        "email": "alex.diwa@gmail.com",
        "position": "Call Center Representative",
        "photo": "https:\/\/uifaces.co\/our-content\/donated\/0VZ0boL5.png"
    },
    {
        "name": "Mary Mart\u00c3\u00adnez",
        "email": "mary.mart\u00c3\u00adnez@gmail.com",
        "position": "Part Time",
        "photo": "https:\/\/uifaces.co\/our-content\/donated\/Zh_4oc5l.jpg"
    },
    {
        "name": "Katie Holmes",
        "email": "katie.holmes@gmail.com",
        "position": "Customer Service Representative",
        "photo": "https:\/\/images-na.ssl-images-amazon.com\/images\/M\/MV5BNTA2NjY5OTkzNl5BMl5BanBnXkFtZTcwMDE2NTkxNA@@._V1_UX172_CR0,0,172,256_AL_.jpg"
    },
    {
        "name": "Taelyn Dickens",
        "email": "taelyn.dickens@gmail.com",
        "position": "Medical Assistant",
        "photo": "https:\/\/i.imgur.com\/PENmJBu.jpg"
    }
]
@fake_user.each do |user| 
  puts user[:name]
end


binding.pry



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

def seed_users
  puts "Clearing all #{User.count}User database..."
  puts "__________________"
  User.destroy_all
  
  # fake user profile
  fake_user = {
    # Generates an RFC 2606 compliant fake email, which means it will never deliver successfully
    email: Faker::Internet.safe_email(name: (Faker::Name.first_name)), #=> "nancy@example.net"
    password: "fakeuser"
  }
  10.times do |user|
    user.create(email: fake_user[:email], password: fake_user[:password])
  end
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
# seed_equipment
