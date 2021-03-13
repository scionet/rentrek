require "open-uri"
require "pry"
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
] 

def scrape_elements(url, selector)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search(selector)
end

def scrape_product(url)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  
  prng = Random.new
  random_price_per_day = prng.rand(6..40)
  # random_category = Category.order(Arel.sql('RANDOM()')).first
  
  gear = {
    name:   html_doc.search("h1.product_title").text,
    description: html_doc.search(".woocommerce-product-details__short-description").text.strip,
    
    price_per_day: random_price_per_day,
    location: Faker::Address.full_address,
    photo: html_doc.search(".woocommerce-product-gallery__image a").attribute('href').value
    
  }
  puts gear
  
  return gear
end

@equipment_category_urls = [
  ["Backpacks", 
    ["https://www.outdoorsgeek.com/product/deuter-act-lite-6010-slim-line-backpack-rental/",
      "https://www.outdoorsgeek.com/product/gregory-jade-backpack-rental/",
      "https://www.outdoorsgeek.com/product/backpack-raincover-rental/"]
  ],["Tents", 
    ["https://www.outdoorsgeek.com/product/marmot-tungsten-ultralight-1-person-tent-rental/",
      "https://www.outdoorsgeek.com/product/big-agnes-copper-spur-hv-ul-2p-tent-rental/",
      "https://www.outdoorsgeek.com/product/marmot-limelight-3p-rental/",
      "https://www.outdoorsgeek.com/product/marmot-limestone-8p-rental/"]
  ],["Sleeping Bags", 
    ["https://www.outdoorsgeek.com/product/north-face-campforter-double-20-sleeping-bag-rental/",
      "https://www.outdoorsgeek.com/product/marmot-kids-trestles-30-degree-bag-rental/",
      "https://www.outdoorsgeek.com/product/the-north-face-inferno-20-degree-down-bag-rental/"]
  ],["Snowshoes", 
    ["https://www.outdoorsgeek.com/product/kids-snowshoe-rental/",
      "https://www.outdoorsgeek.com/product/shoe-traction-chains-rental/",
      "https://www.outdoorsgeek.com/product/black-diamond-cirque-gaiter-rental/",
      "https://www.outdoorsgeek.com/product/adult-snowshoe-rental/"]
  ],["Sleeping Pads", 
    ["https://www.outdoorsgeek.com/product/klymit-insulated-hammock-v-pad-rental/",
      "https://www.outdoorsgeek.com/product/big-agnes-insulated-air-core-ultra-pad-rental/",
      "https://www.outdoorsgeek.com/product/klymit-double-v-pad-rental/"]
  ],["Cooking", 
    ["https://www.outdoorsgeek.com/product/msr-superfly-stove-without-autostart-rental/",
      "https://www.outdoorsgeek.com/product/jetboil-minimo-rental/",
      "https://www.outdoorsgeek.com/product/ao-soft-side-cooler-48-pack-rental/",
      "https://www.outdoorsgeek.com/product/gsi-pinnacle-dualist-cookware-2-rental/"]
  ],["GPS", 
    ["https://www.outdoorsgeek.com/product/inreach-mini-rental/",
      "https://www.outdoorsgeek.com/product/inreach-explorer-rental/"]
  ],["Bear Cans", 
    ["https://www.outdoorsgeek.com/product/bear-canister-rental/"]
  ],
]

def seed_equipment_enhanced(users)
  puts 'Cleaning database...'
  puts "__________________"
  
  
  
  @equipment_category_urls.each do |category|
    category[1].each do |url|
      gear = scrape_product(url)
      
      e =  Equipment.create(
        name: gear[:name],
        description: gear[:description],
        
        user_id: User.order(Arel.sql('RANDOM()')).first.id,
        
        category: Category.find_by(name: category[0]),
        price_per_day: gear[:price_per_day],
        location: "Montreal, Qc"
      )
      e.photos.attach( io: URI.open(gear[:photo]), filename: "thumnail.png",  content_type: 'image/png')
      e.save if e.valid?
      puts "#{e.name} created"
      puts gear
    end
  end
  
  puts "Equipment Generated!"
end

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
  
  Equipment.destroy_all
  User.destroy_all
  
  @fake_users.each do |fake_user|
    
    file = URI.open(fake_user[:photo])
    new_user = User.create(email: fake_user[:email], password: "fakeuser")
    new_user.avatar.attach(io: file, filename: "user_avatar.png", content_type: 'image/png')
    
    @fake_users_created << new_user
    
  end
  
  puts @fake_users_created
  seed_equipment_enhanced(@fake_users_created)
end

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
    
    category = category.children.text.strip.squeeze(" ")
    
    Category.create(name:category.squeeze(" ")) if category.ascii_only?
  end
  
  puts 'Categories generated!'
  puts "__________________"
  puts Category.all
end
seed_categories_enhanced
seed_users 
