source 'https://rubygems.org'

ruby '2.0.0'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails'# , '~> 4.0.0'
gem "bootstrap-sass"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'# , '~> 4.0.0'

# server
gem "thin", ">= 1.5.0"

# javascripts to be included in application.js
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'best_in_place'

# view template engine
gem "haml"

# mail
gem "sendgrid", ">= 1.0.1"

# authentication
gem "devise", '3.0.0'
gem 'devise_invitable', 
    github: 'scambra/devise_invitable', 
    branch: 'rails4'
gem "cancan"
gem "rolify"
gem "simple_form", '3.0.0.rc'
# gem "jquery-validation-rails"

# gem "client_side_validations"
# gem "client_side_validations-simple_form"

# environment variables
gem "figaro"

gem 'font-awesome-rails'
gem 'google-webfonts'
gem 'sextant'
gem 'libv8'
gem 'faker'
gem 'kaminari'
gem 'ledermann-rails-settings', :require => 'rails-settings'
# gem 'meta-tags', :require => 'meta_tags'
gem 'gmaps4rails'
# gem 'twitter-bootstrap-markup-rails', '0.3.2.2'
gem 'best_in_place'

# photo upload, resizing, rendering and storage
gem 'carrierwave'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby



group :development do 
  gem 'travis-lint'
  # gem 'sqlite3'
  gem 'haml-rails', '0.3.5'
  gem 'hpricot', '0.8.6'
  gem 'ruby_parser', '3.1.1'
  # gem 'hub', '1.10.2', require: nil
end

group :test do 
  
  # gem 'spork', '>= 1.0.0rc3'
  # gem 'spork-rails'
  gem 'turnip', '1.0.0'
  gem 'email_spec'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  gem 'database_cleaner', '0.9.1'
  gem 'launchy', '2.1.2'
  gem 'headless', '0.3.1'
  # gem 'phantomjs'
end

group :test, :development do
  
  # gem 'parallel_tests'
  # gem 'zeus-parallel_tests'  
  # gem "jasminerice" #, :git => 'https://github.com/bradphelan/jasminerice.git' 
  # gem 'therubyracer', ">= 0.11.0", :platform => :ruby, :require => "v8"
  # gem 'rspec-rails'
  # gem 'rspec-given', '2.2.0'
  gem 'factory_girl_rails'
  # gem 'teaspoon'
  # gem 'guard-teaspoon'
  gem 'rb-inotify'
  gem 'rb-fsevent'
  gem 'debugger'
  gem 'pry'

  # Guards
  gem 'guard'
  # gem 'guard-zeus_server'
  # gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-rails'
  # gem 'guard-sass', require: false
  # gem 'guard-jasmine'
end
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
