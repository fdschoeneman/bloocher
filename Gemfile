source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '3.2.13'
gem 'pg'

gem 'jquery-rails'
gem "thin", ">= 1.5.0"
gem "haml"
gem "bootstrap-sass"
gem "sendgrid", ">= 1.0.1"

# authentication
gem "devise", ">= 2.1.2"
gem 'devise_invitable', '~> 1.1.0'
gem "cancan"
gem "rolify"
gem "simple_form", ">= 2.0.4"
# gem "jquery-validation-rails"

# gem "client_side_validations"
# gem "client_side_validations-simple_form"
gem "figaro", ">= 0.5.0"
gem 'font-awesome-rails'
gem 'google-webfonts'
gem 'sextant'
gem 'libv8'
gem 'faker'
gem 'kaminari'
gem 'ledermann-rails-settings', :require => 'rails-settings'
# gem 'meta-tags', :require => 'meta_tags'
gem 'gmaps4rails'
gem 'twitter-bootstrap-markup-rails', '0.3.2.2'
gem 'best_in_place'

gem 'carrierwave'


group :assets do
  gem 'parallel_tests'
  gem 'zeus-parallel_tests'  
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :development do 
  gem 'travis-lint'
  # gem 'sqlite3'
  gem 'haml-rails', '0.3.5'
  gem 'hpricot', '0.8.6'
  gem 'ruby_parser', '3.1.1'
  # gem 'hub', '1.10.2', require: nil
end

group :test do 
  
  gem 'spork', '>= 1.0.0rc3'
  gem 'spork-rails'
  gem 'turnip', '1.0.0'
  gem 'email_spec'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  gem 'database_cleaner', '0.9.1'
  gem 'launchy', '2.1.2'
  gem 'headless', '0.3.1'
end

group :test, :development do
  
  gem "jasminerice" #, :git => 'https://github.com/bradphelan/jasminerice.git' 
  gem "therubyracer", ">= 0.11.0", :platform => :ruby, :require => "v8"
  gem 'rspec-rails'
  gem 'rspec-given', '2.2.0'
  gem 'factory_girl_rails'
  gem 'rb-inotify'
  gem 'debugger'
  gem 'pry'

  # Guards
  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'guard-sass', require: false
  gem 'guard-jasmine'
end

group :production do
  # gem 'pg'
end