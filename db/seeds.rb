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

@fake_users = [
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
  }
] # from ui faces API

def scrape_elements(url, selector)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(selector)
end

def scrape_product(url)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search(selector)
  # .product_title
  # woocommerce-product-details__short-description
  gear = {
        name:   html_doc.search("h1.product_title").text,
        description: html_doc.search(".woocommerce-product-details__short-description").text.strip,
        user_id: User.select(:id).where(email: user.email).first[:id],
        category: random_category,
        # document.querySelector("p.price bdi:last-child").lastChild.data
        price_per_day: random_price_per_day,
        location: "Montreal, Qc"
  }
      e.photos.attach( io: URI.open("https://picsum.photos/600/400?#{random_category.name}"), filename: "thumnail.png",  content_type: 'image/png')


end

def seed_equipment_enhanced(users)
  puts 'Cleaning database...'
  puts "__________________"
  # Equipment.destroy_all
  # User.destroy_all
  
  
  
  # e = Equipment.create(
  #   name: "Kites FUELs 11m. et 9m. 2018",
  #   description: random_description,
  #   user_id: user1.id,
  #   category: Category.order(Arel.sql('RANDOM()')).first,
  #   price_per_day: 30,
  #   location: "Montreal, Qc"
  # )
  
  
  # e.photos.attach( io: URI.open("https://picsum.photos/200/300"), filename: "thumnail.png",  content_type: 'image/png')
  # e.save
  equipment_urls = [
    ["Tents",
    "https://www.outdoorsgeek.com/product/deuter-act-lite-6010-slim-line-backpack-rental/",
    "https://www.outdoorsgeek.com/product/gregory-jade-backpack-rental/",
    "https://www.outdoorsgeek.com/product/backpack-raincover-rental/",
    "https://www.outdoorsgeek.com/product/gregory-baltoro-backpack-rental/",
    "https://www.outdoorsgeek.com/product/shoe-traction-chains-rental/"
  ]
  users.each do |user|
    3.times do |e|
      prng = Random.new
      random_title = Faker::Lorem.sentence
      random_description = Faker::Lorem.paragraph(sentence_count: prng.rand(2..4))
      random_price_per_day = prng.rand(6..40)
      random_category = Category.order(Arel.sql('RANDOM()')).first

      
      # html_file = open(url).read
      # html_doc = Nokogiri::HTML(html_file)
      # html_doc.search(selector)

      e =  Equipment.create(
        name: random_title,
        description: random_description,
        user_id: User.select(:id).where(email: user.email).first[:id],
        category: random_category,
        price_per_day: random_price_per_day,
        location: "Montreal, Qc"
      )
      e.photos.attach( io: URI.open("https://picsum.photos/600/400?#{random_category.name}"), filename: "thumnail.png",  content_type: 'image/png')
      e.save if e.valid?
      
      puts "#{e.name} created"
      
    end
  end
  puts "Equipment Generated!"
end


# --------------------------------------------
@fake_users_created = []
def seed_users
  
  puts "Clearing all #{@fake_users_created.count} fake users from User database..."
  puts "__________________"
  @fake_users_created.each do |usr|
    Equipment.where(user_id: usr.id).each do |equipment|
      equipment.destroy
    end
    usr.destroy
  end
  @fake_users_created = []
  # binding.pry

  # ----------
  Equipment.destroy_all
  User.destroy_all
  # ----------
  @fake_users.each do |fake_user|
    
    file = URI.open(fake_user[:photo])
    new_user = User.create(email: fake_user[:email], password: "fakeuser")
    new_user.avatar.attach(io: file, filename: "user_avatar.png", content_type: 'image/png')
    # new_user.save
    # binding.pry
    @fake_users_created << new_user
    # binding.pry
  end
      # binding.pry
    puts @fake_users_created
    seed_equipment_enhanced(@fake_users_created)
end

# User.all #=> [#<User id: 55, email: "kent.sosa@gmail.com", created_at: "2021-03-12 23:40:00", updated_at: "2021-03-12 23:40:00">, ...]
# ---------------------------------------------





# --------------------------------------------  



def seed_categories_enhanced
  puts 'Cleaning categories...'
  puts "__________________"
  Category.destroy_all 
  
  @outdoorsgeek = {
    url: "https://www.outdoorsgeek.com/rent-it/",
    selector: "div.et_pb_section:nth-child(3) h3 a"
  }
  
  categories = scrape_elements(@outdoorsgeek[:url], @outdoorsgeek[:selector])
  
  puts 'Populating Categories...'
  puts "__________________"
  categories.each do |category|
    
    # puts category.children.text
    category = category.children.text.strip.squeeze(" ")
    
    # category.gsub!("  ".)
    Category.create(name:category.squeeze(" ")) if category.ascii_only?
  end
  
  puts 'Categories generated!'
  puts "__________________"
  puts Category.all
end

# seed_categories_enhanced











# --------------------------------------------


=begin def scrape_for_equipments
@outdoorsgeek = {
  url: "https://www.outdoorsgeek.com/rent-it/",
  selector: "div.et_pb_section:nth-child(3) h3 a"
}
nodes = scrape_elements(@outdoorsgeek[:url], @outdoorsgeek[:selector])
nodes.each do |element|
  
  link = element.attributes["href"].value
  
  if link.
  end
end =end


scrape_for_equipments



=begin def seed_equipment
# --------------------------------------------
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


e.photos.attach( io: URI.open("https://picsum.photos/200/300"), filename: "thumnail.png",  content_type: 'image/png')
e.save

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
=end # --------------------------------------------






# seed_categories_enhanced
seed_users 
# seed_equipment_enhanced