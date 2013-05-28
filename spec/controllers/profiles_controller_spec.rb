require 'spec_helper'

describe ProfilesController do

  Given!(:user) { FactoryGirl.create(:user) }

  context "for logged in user" do 
  
    Given { sign_in user }
    
    describe "GET 'show' should return http success" do
        
      When { get 'show' }
      Then { response.should be_success }
    end

    describe "PUT 'update' should return http success" do
 
      When { put 'update', id: user.id  }
      Then { response.should be_success }
    end
  end

  context "when not authenticated" do 

    describe "GET 'show' should fail" do

      When { get 'show' }
      Then { response.should_not be_success }
    end

    describe "PUT 'update' should fail" do
      
    end
  end
end
