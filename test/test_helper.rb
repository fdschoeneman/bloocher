ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

Dir[File.expand_path('test/support/*.rb')].each { |file| require file }

# WebMock.disable_net_connect!(allow_localhost: true)

require 'rails/test_help'
