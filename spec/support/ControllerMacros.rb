module ControllerMacros
  
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  #   end
  # end

  def login(factory, user_type)

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[user_type]
      user = FactoryGirl.create(factory)
      sign_in user
    end
  end
end