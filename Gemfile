source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

# postgresql database
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails' 
gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# server
gem "thin", ">= 1.5.0"

# javascript 
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'best_in_place',
    github: 'bernat/best_in_place', 
    branch: 'rails-4'
# fonts
gem 'font-awesome-rails'
gem 'google-webfonts'
gem 'ember-rails'
gem 'ember-source', '1.0.0.rc6.2'
# view template engine
gem "haml"
gem 'haml-rails', '0.3.5'

# mail
gem "sendgrid", ">= 1.0.1"

# authentication
gem 'devise', '3.0.0'
gem 'devise_invitable', 
    github: 'scambra/devise_invitable', 
    branch: 'rails4'
gem 'cancan'
gem 'rolify'

# forms
gem 'simple_form', '3.0.0.rc'

# gem "client_side_validations"
# gem "client_side_validations-simple_form"

# environment variables
gem 'figaro'

gem 'faker'

# pagination
gem 'kaminari'

gem 'ledermann-rails-settings', :require => 'rails-settings'

# Cleaner metatags
gem 'meta-tags', :require => 'meta_tags'

# For interacting with google maps on
gem 'gmaps4rails'

# common helpers for use with bootstrap
# gem 'twitter-bootstrap-markup-rails'

# photo upload, resizing, rendering and storage
gem 'carrierwave'

# pretty development data
gem 'faker'

group :development do 
  gem 'travis-lint'
  gem 'hpricot', '0.8.6'
  gem 'ruby_parser', '3.1.1'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'binding_of_caller'
end

group :test do 
  
  gem 'minitest-rails-shoulda', '~> 0.4.1'
  gem 'minitest-capybara', '0.1'
  gem 'minitest-rails-capybara'
  gem 'wrong'
  gem 'minitest-given'

  # pretty test output
  gem 'ansi'
  gem 'turn'

  # capybara save_and_open dependency
  gem 'launchy'
end

group :test, :development do
  
  # minitest
  gem 'minitest'
  gem 'minitest-rails', '0.5.2'
    
  # preloads rails app for faster test and development tasks
  gem 'zeus'#, 
    # github: 'burke/zeus', 
    # branch: 'master'

  # test factories  
  gem 'factory_girl_rails'
  
  # ubuntu notifications for test
  gem 'rb-inotify'
  gem 'rb-fsevent'
  
  # debugging
  gem 'debugger'
  gem 'pry'

  # Guards
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-livereload'
  gem 'guard-minitest'

  # gem 'teaspoon'
  # gem 'turnip', '1.0.0'
  # gem 'email_spec'
  # gem 'capybara'
  # gem 'capybara-webkit'
  # gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'headless', '0.3.1'
  # gem 'phantomjs'
  # gem 'guard-teaspoon'
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :production do 
  
  gem 'rails_12factor', group: :production
end

group :doc do

  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

