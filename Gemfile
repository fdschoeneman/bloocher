source 'https://rubygems.org'

gem 'rails', '3.2.10'


gem 'jquery-rails'
gem "thin", ">= 1.5.0"
gem "haml", ">= 3.1.7"
gem "bootstrap-sass", ">= 2.2.2.0"
gem "sendgrid", ">= 1.0.1"
gem "devise", ">= 2.1.2"
gem "simple_form", ">= 2.0.4"
gem "figaro", ">= 0.5.0"
gem 'font-awesome-rails'
gem 'google-webfonts'
gem 'sextant'
gem 'libv8'

group :assets do
  gem "therubyracer"#, ">= 0.11.0", :platform => :ruby, :require => "v8"
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development do 
  gem 'sqlite3'
  gem 'haml-rails', '0.3.5'
  gem 'hpricot', '0.8.6'
  gem 'ruby_parser', '3.1.1'
  gem 'hub', '1.10.2', require: nil
end

group :test do 
  
  # test server
  gem 'spork', '0.9.2'
  
  # acceptance tests
  gem 'turnip', '1.1.0'
  gem 'email_spec', '1.4.0'
  gem 'shoulda-matchers', '1.4.1'
  gem 'capybara', '1.1.3'
  gem 'capybara-webkit', '0.13.0'
  gem 'selenium-webdriver', '2.26.0'
  gem 'database_cleaner', '0.9.1'
  gem 'launchy', '2.1.2'
  gem 'headless', '0.3.1'

 # Guards
  gem 'guard', '1.5.4'
  gem 'guard-spork', '1.2.3'
  gem 'guard-rspec', '2.1.1'
  gem 'guard-bundler', '1.0.0'
  gem 'guard-livereload', '1.1.0'
  gem 'guard-rails', '0.1.1'
  gem 'guard-sass', '1.0.1', require: false
end

group :test, :development do 
  gem 'rspec-rails', '2.12'
  gem 'rspec-given', '2.2.0'
  gem 'factory_girl_rails', '4.1.0' 
  gem 'rb-inotify', '~> 0.8.8'
  gem 'faker'
end

group :production do
  gem 'pg'
end