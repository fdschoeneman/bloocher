require "test_helper"

describe WineriesController do


  Given(:user) { FactoryGirl.create(:user) }

	describe "index" do

    Given(:winery) { create(:winery) }

    Given { get :index }
    
    Then { assert_response :success }
    And { assert_not_nil assigns(:wineries) }
  end

  describe "new" do

    Given { sign_in user}
    
    Given { get :new }
    
    Then { assert_response :success }
    And { assert_not_nil assigns(:winery) }
  end

  describe "create" do
    
    describe "winery" do

      Given(:winery_attrs) { attributes_for(:winery) }
      
      Then { 
        assert_difference('Winery.count') { 
        post :create, winery: winery_attrs } 
      }
      And { assert_redirected_to winery_path(Winery.last) }
    end
  end

	describe "show" do
   	
   	Given(:winery) { create(:winery) }

    ["winery.slug", "winery.id"].each do |attribute| 
    
      describe "a winery from the #{attribute}" do

        Given { get :show, id: eval(attribute) }
        
        Then { assert_response :success }
        And { assert_not_nil assigns(:wines) }
        And { assert_not_nil assigns(:review) }
        And { assert_not_nil assigns(:reviews) }
      end
    end
  end
end
