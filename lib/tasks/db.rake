
require 'rubygems'
require 'faker'

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
  end
end

def make_admin_user
  admin_user = User.new(
    name: "Fredzilla", 
    email: "fred.schoeneman@gmail.com", 
    password: "password",
    password_confirmation: "password")
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
    user.save!
    user.confirm!
  end
end

def make_wineries
  # 99.times do |n|
    # name = boonville_wineries.sample

end

def make_wines
  # 99.times do 
    # boonville_wineries = { name 
end

def make_reviews 
end

boonville_wineries = [
  "Angel Camp Vineyards", 
  "Balo Vineyards",
  "Baxter Winery",
  "Bink Wines",
  "Black Kite Cellars",
  "Breggo Cellars",
  "Brutocao Cellars",
  "Champ de Reves Vineyards",
  "Claudia Springs Winery",
  "Copain Wines",
  "Couloir Wines",
  "Drew Family Cellars",
  "Edmeades Winery",
  "Elke Vineyards",
  "Esterlina Vineyards",
  "Expression Vineyards",
  "Foursight Wines, Inc.",
  "Frati Horn Wines",
  "Fulcrum Wines",
  "Goldeneye Winery",
  "Greenwood Ridge Vineyards",
  "Handley Cellars",
  "Harmonique - Conzelman Vineyards",
  "Husch Vineyards",
  "Knez Winery",
  "Lazy Creek Vineyards",
  "Littorai Wines",
  "Londer Vineyards",
  "Lula Cellars",
  "MacPhail Family Wines",
  "Maggy Hawk Vineyard",
  "Navarro Vineyards",
  "Phillips Hill Winery",
  "Philo Ridge Vineyards",
  "Roederer Estate",
  "Roessler Cellars",
  "Scharffenberger Cellars",
  "Toulouse Vineyards",
  "Twomey Cellars",
  "Waits-Mast Family Cellars",
  "Zina Hyde Cunningham"
]

