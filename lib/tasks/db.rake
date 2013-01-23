require 'rubygems'
require 'faker'

Dir[Rails.root.join("lib/sample_data/*.rb")].each {|f| require f}

include WineData
include ReviewData
 
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
  task populate: :environment do
    if Rails.env.development?
      puts "#{red("==>")} Clearing Current Data"
      Rake::Task['db:reset'].invoke
    end
    puts "#{green("==>")} Making admin user"
    make_admin_user
    puts "#{green("==>")} Making sample users"
    make_users
    puts "#{green("==>")} Making wineries"
    make_wineries    
    puts "#{green("==>")} Making wines"
    make_wines
    puts "#{green("==>")} Making reviews"
    make_reviews
    puts "#{green("==>")} Making producers"
    make_producers  
    puts "#{green("==>")} Making ownerships"
    make_ownerships
    puts "#{green("==>")} Making winemaker oeuvres"
    make_winemaker_oeuvres
    
  end
end

def make_admin_user
  admin_user = User.new(
    name: "Fredzilla", 
    email: "fred.schoeneman@gmail.com", 
    password: "password",
    password_confirmation: "password")
  admin_user.skip_confirmation!
  admin_user.save!
  admin_user.confirm!
end

def make_users
  99.times do |n|
    name = Faker::Name.name 
    email = Faker::Internet.email
    password  = "password"
    user = User.new(name: name,
                    :email => email,
                    :password => password)  
    user.skip_confirmation!
    user.save!
    user.confirm!
  end
end

def make_wineries


  boonville_wineries.each do |winery_name|
    Winery.create(
      name: winery_name, 
      producer_id: "#{rand(1..20) }"
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
    Wine.create!( 
      vintage: vintage,
      cases_produced: rand(2000..100000),
      name: "#{wine_types.sample} \- #{vineyard_names.sample} \- #{differentiators.sample}",
      winery_id: rand(1..40),   
      acid_added: rand(0..1),
      new_french_oak: rand(1..100),
      days_in_oak: rand(90..180),
      bottled_on: "#{bottled_on_year}-#{rand(1..12)}-#{rand(1..30)}",
      released_on: "#{released_on_year}-#{rand(1..12)}-#{rand(1..30)}",
      
      winemaker_notes: "#{Faker::Lorem.paragraphs(5)}",
      ph: "#{(rand(665..755).to_f)/100}",
      residual_sugar: "#{(rand(1..5).to_f)/100}",
      alcohol: "#{(rand(125..175).to_f)/1000}",
      new_french_oak: new_french_oak,
      one_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
      two_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
      three_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
      new_american_oak: "#{(100 - new_french_oak)/7}",
      one_yr_old_american_oak: "#{(100 - new_french_oak)/7}",
      two_yr_old_american_oak: "#{(100 - new_french_oak)/7}",
      three_yr_old_american_oak: "#{(100 - new_french_oak)/7}"
    )
  end
end

def make_reviews 
  include 
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
  99.times do |n|
    Producer.create(address_1: Faker::Address.street_address,
      address_2: Faker::Address.secondary_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip: Faker::Address.zip_code
    )
  end
end

def make_ownerships

end

def make_winemaker_oeuvres

end


