require "test_helper"

feature "Users::Authentication Feature Test" do
  
  scenario "Sign up with devise" do
    visit new_user_registration_path
    fill_in 'user_email', with: 'test@test.com'
    find_button('Sign up').click
    page.must have_selector("#flash_notice", text: /link has been sent/)
    User.where(email: "test@test.com").wont_be_nil
  end

  scenario "Sign up with facebook" do 
    OmniAuth.config.test_mode = true 
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid: '123545',
      info: {
        nickname: "fredtasticvoyager",
        email: "fred.schoeneman@gmail.com",
        first_name: "Fred",
        last_name: "Schoeneman",
        name: "Fred Schoeneman",
        urls: {
          Facebook: "https://www.facebook.com/fredtasticvoyager"
        },
        location: "Oakland, California"
      }
    })
    # request.env["devise.mapping"] = Devise.mappings[:user] 
    # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] 
  
    visit user_omniauth_authorize_path(:facebook)
    page.must have_selector("#flash_notice", text: /Signed in with Facebook/)
  end

  scenario "sign up with twitter" do 

  end

  scenario "sign up with linkedin" do 

  end

  scenario "sign up with instagram" do 

  end

  scenario "sign up with pinterest" do 

  end

  scenario "confirm account" do 

  end
end
