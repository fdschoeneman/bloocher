source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails'

# postgresql database
gem 'pg'

# Elastic search wrapper, eventurally to be replaced with elasticsearch-ruby when the documentation is better
gem 'tire'

# Use SCSS for stylesheets
gem 'sass-rails' 

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# foundation js & css framework
gem 'zurb-foundation'
# server
gem 'thin', '>= 1.5.0'

# javascript 
gem 'jquery-rails'
gem 'jquery-ui-rails'
# gem 'best_in_place',
#     github: 'bernat/best_in_place', 
#     branch: 'rails-4'

# fonts
gem 'font-awesome-rails'
gem 'google-webfonts'

# ember
gem 'ember-rails'
gem 'ember-source', '1.0.0.rc6.4'
gem 'emblem-rails'

# view templates
gem 'haml'
gem 'haml-rails'#, 
    # github: 'indirect/haml-rails',
    # branch: 'master'

# mail
gem 'sendgrid', '>= 1.0.1'

# authentication
gem 'devise'#, '3.0.0'
gem 'devise_invitable'#, 
    # github: 'scambra/devise_invitable', 
    # branch: 'rails4'

# permissions
gem 'cancan'

# user roles
gem 'rolify', '3.3.0.rc4'

# omniauth
gem 'omniauth-facebook'
gem 'omniauth-gplus'
gem 'omniauth-instagram'
gem 'omniauth-linkedin'
gem 'omniauth-twitter'

# forms
gem 'simple_form'#, '3.0.0.rc'

# for google link shortener
gem 'google-api-client'

# qr codes
gem 'rqrcode-rails3'

# friendly ids
gem 'friendly_id'
# gem "client_side_validations"
# gem "client_side_validations-simple_form"

# environment variables
gem 'figaro'

# pagination
gem 'kaminari'

# gem 'ledermann-rails-settings', :require => 'rails-settings'

# Cleaner metatags
gem 'meta-tags', :require => 'meta_tags'

# mapipng addresses
gem 'geocoder'

# For interacting with google maps on vineyards

# common helpers for use with bootstrap
# gem 'twitter-bootstrap-markup-rails'

# photo upload, resizing, rendering and storage
gem 'carrierwave'

# store assets in the cloud
gem 'fog'

# generates retina versions of uploaded images
gem 'retina_rails'

# image resizing
gem 'mini_magick'

# pretty development data
gem 'faker'
gem 'faker-bloocher'
gem 'faker-stoked'#, github: 'fdschoeneman/faker-stoked', branch: 'master'
gem 'sprockets-rails', :require => 'sprockets/railtie'


group :development do 

  gem 'travis-lint'
  gem 'hpricot', '0.8.6'
  gem 'ruby_parser', '3.1.1'
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'rails_best_practices'
  gem 'rails-erd'

end

group :test do 
  
  gem 'minitest-rails-shoulda'
  gem 'minitest-rails-capybara'
  gem 'minitest-given'
  gem 'wrong'

  # pretty test output
  gem 'ansi'
  gem 'turn'

  # capybara save_and_open dependency
  gem 'launchy'

  # recording external responses for tests
  gem 'vcr'
  gem 'webmock'
end

group :test, :development do
  
  # minitest
  gem 'minitest'
  gem 'minitest-rails'
    
  # preloads rails app for faster test and development tasks
  gem 'spring'


  # test factories  
  gem 'factory_girl_rails'
  
  # ubuntu notifications for test
  gem 'rb-inotify'
  gem 'rb-fsevent'
  
  # debugging
  gem 'debugger'
  gem 'pry'
  gem 'awesome_print', require: 'ap'


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
# gem 'jbuilder', '~> 1.2'

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
gem 'execjs'
gem 'therubyracer'
