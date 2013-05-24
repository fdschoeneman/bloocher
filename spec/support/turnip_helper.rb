Dir[Rails.root.join("spec/acceptance/steps/**/*.rb")].each {|f| require f}
Dir[Rails.root.join("spec/acceptance/steps/*.rb")].each {|f| require f}
Dir[Rails.root.join("lib/turnip/*.rb")].each {|f| require f}

RSpec.configure do |c|
  c.include AuthenticationSteps
  c.include EmailHandlingSteps
  c.include UtilitySteps
  c.include ReviewSteps
end
