require "test_helper"

describe OmniauthCallbacksController do

  Given { 
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
    request.env["devise.mapping"] = Devise.mappings[:user] 
  }

  Given { request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook] } 
  
  describe "get facebook" do 
  
    Given { post :facebook }
  
    Given(:hash) { request.env["omniauth.auth"] } 
  
    describe "returns provider" do 
      
      Then { assert_equal hash[:provider], "facebook" }
    end

    describe "returns uid" do 

      Then { assert_equal hash[:uid], "123545" }
    end

    describe "returns facebook email" do

      Then { assert_equal hash[:info][:email], "fred.schoeneman@gmail.com" }
    end
  
    describe "creates an authentication" do 

      Then { Authentication.where(provider: hash[:provider], uid: hash[:uid])
        .wont_be_empty }
    
    end

    describe "when email is returned" do 

      Then { User.where(email: hash[:info][:email]).wont_be_empty}



    end
  end
end
