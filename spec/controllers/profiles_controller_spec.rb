require 'spec_helper'

describe ProfilesController do

  describe "for logged in user" do 

    When { sign_in FactoryGirl.create(:user) }

    describe "GET 'show'" do
      it "returns http success" do
        get 'show'
        response.should be_success
      end
    end

    describe "GET 'edit'" do
      it "returns http success" do
        get 'edit'
        response.should be_success
      end
    end
  end
end
