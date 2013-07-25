ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

Dir[File.expand_path('test/support/*.rb')].each { |file| require file }

require 'minitest/unit'
MiniTest::Unit.class_variable_set('@@installed_at_exit', true) if defined? Zeus

require 'rails/test_help'

