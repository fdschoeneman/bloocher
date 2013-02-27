Dir[Rails.root.join("spec/acceptance/steps/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("spec/acceptance/steps/*.rb")].each {|f| require f}
Dir[Rails.root.join("lib/turnip/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include AuthenticationSteps
  config.include EmailHandlingSteps
  config.include UtilitySteps
end
