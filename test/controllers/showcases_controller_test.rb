require "test_helper"

describe ShowcasesController do

  Given(:admin) { create(:admin) }
  Given!(:showcase) { create(:showcase) }

  describe "index" do

    Given { get :index }
    
    describe "success" do 

      Then { assert_response :success }
      And { assert_not_nil assigns(:showcases) }
    end 
  end

  describe "new" do
    
    When { get :new }
    Then { assert_response :success }
  end

  describe "create" do
    
    describe "showcase and redirect to showcase" do

      When(:showcase_attrs) { attributes_for(:showcase) }
      Then { 
        assert_difference('Showcase.count') { 
        post :create, showcase: showcase_attrs } 
      }
      And { assert_redirected_to showcase_path(assigns(:showcase)) }
    end
  end

  describe "show" do
    
    describe "a showcase" do 

      When { get :show, id: showcase.id }
      Then { assert_response :success }
    end

    describe "assigns the showcase's wines" do 

      # Given(:showcase_with_wines) { create(:showcase_with_wines) } 
      # Given { get :show, id: showcase_with_wines.id }
      # Then { assert_not_nil assigns(:showcase) }
    end
  end

  describe "edit" do

    When { get :edit, id: showcase.id }
    Then { assert_response :success }
  end

  describe "update" do
    
    # When(:desired_attrs) { showcase: { name: "new name" }}}  # When(:showcases_wine_attrs) { attributes_for(:showcases_wine) }
    # Given { put :update, id: showcase, showcase: { name: "new name" } }
    # Then { assert_redirected_to showcase }

    # describe "must create showcase wines" do 
    #   Given(:wine) { create(:wine) }
    #   Given { put :update, id: showcase, showcase: { wines_attributes: wine.id }  }
    #   Then { }# Then { showcase.wines.must include wine }
    # end
  end

  describe "must destroy showcase" do

    Then { assert_difference('Showcase.count', -1) {
      delete :destroy, id: showcase.id } }
    And { assert_redirected_to showcases_path }
  end
end
