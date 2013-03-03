RSpec.configure do |c|

  c.include Devise::TestHelpers, 	type: :controller
  c.extend ControllerMacros, 			type: :controller
end
