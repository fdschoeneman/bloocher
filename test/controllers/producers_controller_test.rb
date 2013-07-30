require "test_helper"

describe ProducersController do

  Given(:admin) { build(:admin) }
  Given!(:producer) { create(:producer) }
  
  describe "index" do
    
    Given { get :index }
    
    describe "success" do 

      Then { assert_response :success }
    end

    describe "assigns producers" do

      Then { assert_not_nil assigns(:producers) }
    end
  end

  describe "new" do
    
    When { get :new }
    Then { assert_response :success }
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
   
    When { get :show, id: producer.id }
    Then { assert_response :success }
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
