require 'rubygems'
require 'faker'

Dir[Rails.root.join("lib/sample_data/*.rb")].each {|f| require f}

include WineData
include ReviewData
include MiscellaneousData
 
def colorize(text, color_code)
 "\e[#{color_code}m#{text}\e[0m"
end

def red(text);      colorize(text, 31); end
def green(text);    colorize(text, 32); end
def yellow(text);   colorize(text, 33); end
def purple(text);   colorize(text, 34); end
def magenta(text);  colorize(text, 35); end
def cyan(text);     colorize(text, 36); end

namespace :db do

  desc "Fill database with sample data" 

  namespace :populate do 

  end

  task populate: :environment do
    if Rails.env.development?
      puts "#{red("==>")} Clearing Current Data"
      Rake::Task['db:reset'].invoke
    end
    puts "#{green("==>")} Making sample users"
    make_users
    # puts "#{green("==>")} Making user roles"
    # make_user_roles
    # puts "#{green("==>")} Making admin user"
    # make_admin_user
    # ["hola.nicole@gmail.com"].each do |email|
    #   puts "#{green("==>")} Making #{email}"
    #   make_user(email)
    # end
    # puts "#{green("==>")} Making wineries"
    # make_wineries    
    # puts "#{green("==>")} Making addresses"
    # make_addresses
    # puts "#{green("==>")} Making wines"
    # make_wines
    # puts "#{green("==>")} Making reviews"
    # make_reviews
    # puts "#{green("==>")} Making producers"
    # make_producers  
    # puts "#{green("==>")} Making vineyard parents"
    # make_vineyard_parents
    # puts "#{green("==>")} Making vineyard blocks"
    # make_vineyard_blocks
    # puts "#{green("==>")} Making vineyard vintages"
    # make_vineyard_vintages
    # puts "#{green("==>")} Making fruit lots"
    # make_fruit_lots
    # puts "#{green("==>")} Making wine fruit lots"
    # make_wine_fruit_lots
    # puts "#{green("==>")} Making certifications"
    # make_certifications
    # puts "#{green("==>")} Making appellations"
    # make_appellations
    # puts "#{green("==>")} Making showcases"
    # make_showcases
    # Rake::Task['db:test:prepare'].invoke
  end
end

def make_user_roles
  
  YAML.load(ENV['ROLES']).each do |role|
    Role.find_or_create_by(name: role)
    puts "#{green("==>")} Making role: " << role
  end
end

def make_user(email)
  
  user = User.new(
    email: email, 
    password: "password",
    password_confirmation: "password", 
    bio: hipster_bios.first)
  user.skip_confirmation!
  user.save
  user.confirm!
  user.add_role :VIP
end

def make_admin_user

  user = User.new(
    name: "Fred Schoeneman", 
    email: "fred.schoeneman@gmail.com", 
    password: "password",
    password_confirmation: "password", 
    bio: hipster_bios.first)

  user.save!
  user.confirm!
  user.add_role :admin
end

def make_users

  99.times do |n|
    name = Faker::Name.name 
    email = Faker::Internet.email
    password  = "password"
    user = User.new(name: name,
                    :email => email,
                    :password => password,
                    bio: Faker::Company.bs)  
    user.skip_confirmation!
    user.save!
    user.confirm!
  end
end

def make_wineries

  boonville_wineries.each do |winery_name|
    Winery.create(
      name: winery_name, 
      producer_id: rand(1..20)
    )
  end
end

def make_wines
  
  99.times do |n|
    vintage = rand(2002..2011)
    bottled_on_year = vintage + 1
    released_on_year = vintage + rand(1..2)
    lay_down_until_year = vintage + rand(1..4)
    drink_before_year = vintage + rand(10..20)
    new_french_oak = (rand(0..100).to_f)/100
    wine = Wine.new( 
      vintage: vintage,
      cases_produced: rand(2000..100000),
      name: "#{wine_types.sample} \- #{vineyard_names.sample} \- #{differentiators.sample}",
      winery_id: rand(1..28),   
      acid_added: rand(0..1),
      new_french_oak: rand(1..100),
      days_in_oak: rand(90..180),
      bottled_on: "#{bottled_on_year}-#{rand(1..12)}-#{rand(1..30)}",
      released_on: "#{released_on_year}-#{rand(1..12)}-#{rand(1..30)}",
      category: wine_types.sample,
      winemaker_notes: Faker::Lorem.sentence(8),
      ph: "#{(rand(665..755).to_f)/100}",
      residual_sugar: "#{(rand(1..5).to_f)/100}",
      alcohol: "#{(rand(125..175).to_f)/1000}",
      one_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
      new_french_oak: new_french_oak,
      two_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
      three_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
      new_american_oak: "#{(100 - new_french_oak)/7}",
      one_yr_old_american_oak: "#{(100 - new_french_oak)/7}",
      two_yr_old_american_oak: "#{(100 - new_french_oak)/7}",
      three_yr_old_american_oak: "#{(100 - new_french_oak)/7}"
    )

    wine.save
  end
end

def make_reviews 
  99.times do |n|
    Review.create(
      rating: rand(70..95),
      reviewer_id: rand(1..99),
      wine_id: rand(1..99),
      # content: Faker::Lorem.paragraphs
      content: hipster_review
    )
  end
end

def make_producers
  20.times do |n|
    name = boonville_producers.sample
    subdomain = name.gsub(" ", "-")
    web_address = "http://www." + subdomain + "." + Faker::Internet.domain_suffix
    Producer.create(
      name: name
    )
  end
end

def make_vineyard

  block_planting_year = rand(1955..2010)
  block_grafting_year = block_planting_year + rand(0..3)
  @vineyard = Vineyard.new(
    topo_aspect: topo_aspects.sample,
    topo_slope: rand(1..50)/1000.to_f,
    topo_elevation: rand(10..8000),
    soil_composition: soil_types.sample,
    soil_drainage: soil_drainage_types.sample,
    soil_depth: rand(18..40),
    soil_fertility: rand(1..40)/1000.to_f,
    soil_water_capacity: rand(6..8),
    soil_ph: rand(38..80)/10.to_f,
    rootstock: rootstock.sample,
    varietal: varietals.sample,
    clone: clones.sample,
    planted_on: rand(1955..2010),
    irrigation: irrigation_types.sample,
    nursery: nurseries.sample,
    planted_on: block_planting_year,
    grafted_on: block_grafting_year
  )
end

def make_vineyard_parents

  boonville_vineyards.each do |vineyard_name|
    make_vineyard
    @vineyard.update_attributes(
      name: vineyard_name,
      producer_id: rand(1..20)
    )
    @vineyard.save
  end
end

def make_vineyard_blocks

  20.times do |block|
    make_vineyard
    block_name = %w[east west north southeast creekside river hillside 1A 2A].sample
    @vineyard.update_attributes(
      name: block_name, 
      producer_id: rand(1..10),
      vineyard_parent_id: rand(1..10)
    )
    @vineyard.save
  end
end

def make_vineyard_vintages

  20.times do |vintage|
    day = rand(1..15)
    month = [4,5].sample
    year = rand(2009..2012)
    last_frost = Time.new(year, month, day) 
    bud_break = Time.new(year, month, day + 13)
    bloom_date = Time.new(year, month + 1, day)
    veraison = Time.new(year, month + 2, day)
    VineyardVintage.create(
      vineyard_id: rand(1..40),
      growing_degree_days: rand(1800..2500),
      days_above_100: rand(2..20),
      last_frost: last_frost,
      bud_break: bud_break,
      bloom_date: bloom_date,
      veraison: veraison,
      average_yearly_rel_hum: rand(60..75)/100.to_f
    )
  end
end

def make_fruit_lots

  20.times do |fruit_lot|
    random_day = rand(1..28)
    harvest_date = Date.new(2012, 8, random_day)
    FruitLot.create(
      brix: rand(150..250)/10.to_f,
      weight: rand(25..250)/100.to_f,
      harvest_date: harvest_date,
      vineyard_vintage_id: rand(1..40)
    )
  end
end

def make_wine_fruit_lots

  20.times do |wine_fruit_lot|
    WineFruitLot.create!(
      wine_id: rand(1..20),
      percent_of_wine: rand(20..100),
      fruit_lot_id: rand(1..20)
    )
  end
end

def make_certifications
  %w[organic usda biodynamic].each do |certification|
    certification = Certification.new(
      name: certification, 
      description: Faker::Lorem.paragraphs.to_s,
      url: Faker::Internet.domain_name
    )
    certification.save
  end

  10.times do |cp|
    CertificationsProducer.create(
      certification_id: rand(1..10), 
      producer_id: rand(1..10)
    )
  end
end

def make_appellations

  appellation_list.each do |appellation|
    appellation = Appellation.new(name: appellation,
      # type: ["country", "county", "state", "area"].sample,
      description: Faker::Lorem.sentence
      )
    appellation.save!
  end
end

def make_showcases

  wine_lists = ["Chez Panisse wines", "Breggo Wines", "Vintage Berkeley"]
  wine_lists.each do |list|
    Showcase.create(
      version: Time.now,
      name: list,
      description: Faker::Lorem.sentence
    )
  end

  10.times do 
    ShowcasesWine.create(
      wine_id: rand(1..100),
      showcase_id: 1
    )
  end
end

def make_addresses
  Winery.all do |winery|
    winery.addresses.create!(
      address_1: Faker::Address.street_address,
      address_2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: "CA",
      zip: Faker::Address.zip_code,
      country: "United States",
      public_phone: Faker::PhoneNumber,
      public_email: Faker::Internet.email,
      public_url: Faker::Internet.domain_name
    )
  end
end
