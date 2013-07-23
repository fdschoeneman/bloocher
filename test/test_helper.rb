ENV["RAILS_ENV"] = "test"
Dir[File.expand_path('test/support/*.rb')].each { |file| require file }

require File.expand_path("../../config/environment", __FILE__)
require 'rails/test_help'

