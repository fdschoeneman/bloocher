require "test_helper"

describe ProducersController do

  Given(:admin) { build(:admin) }
  Given!(:producer) { create(:producer) }
  
  describe "index" do
    
    Given { get :index }
    
    describe "success" do 

      Then { assert_response :success }

      And { assert_not_nil assigns(:producers) }
    end
  end

  describe "new" do
    
    Given { get :new }
    
    Then { assert_response :success }
    And { assert_not_nil assigns(:producer) }
  end

  describe "create" do

    describe "producer and redirect to show that producer" do 

      When(:producer_attrs) { attributes_for(:producer) }
      Then { assert_difference('Producer.count') {
        post :create, producer: producer_attrs }
      }
      And { assert_redirected_to producer_path(assigns(:producer)) } 
    end
  end
  
  describe "show" do
   
    ["producer.slug", "producer.id"].each do |attribute| 
    
      describe "a winery's wine rom the #{attribute}" do

        Given { get :show, id: eval(attribute) }
        
        Then { assert_response :success }
        And { assert_not_nil assigns(:wineries) }
        And { assert_not_nil assigns(:vineyards) }
      end
    end
  end

  describe "edit" do 
    
    When { get :edit, id: producer.id }
    Then { assert_response :success }
  end
  
  describe "update" do
    
    describe "name" do 

      Given { put :update, id: producer.id, producer: { name: "new name" } }
      Then { assert_redirected_to producer }
    end
  end

  describe "must destroy producer" do
    
    Then { assert_difference('Producer.count', -1) { 
      delete :destroy, id: producer.id } }
    And { assert_redirected_to producers_path }
  end
end
