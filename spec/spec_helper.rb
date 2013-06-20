require 'rubygems'

ENV["RAILS_ENV"] = 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'factory_girl_rails'
require 'rspec/rails'
require 'rspec/given'
require 'capybara/rspec'
require 'capybara/rails'
require 'shoulda-matchers'
require 'database_cleaner'
require 'turnip_helper'

Capybara.javascript_driver = :webkit

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Warden::Test::Helpers
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL

  config.mock_with :rspec
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.use_transactional_examples = false
  config.infer_base_class_for_anonymous_controllers = true    
  config.order = "random"
end