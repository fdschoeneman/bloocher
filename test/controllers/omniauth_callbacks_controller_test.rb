require "test_helper"

describe OmniauthCallbacksController do

  Given { 
    OmniAuth.config.test_mode = true 
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      :provider => 'facebook',
      :uid => '123545',
      :info => {
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
    request.env["devise.mapping"] = Devise.mappings[:user] 
  }

  describe "all" do 

    Given { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] } 
    
    describe "facebook" do 

      When { post :facebook }
      # Then { assert_response :redirect }
      Then { User.find_by_email("fred.schoeneman@gmail.com").wont_be_nil
         }
      # assert_equal request.env["omniauth.auth"][:provider], "facebook" }
    end
  end
end
