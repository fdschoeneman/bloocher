require "test_helper"

describe WinesController do

  Given(:winery) { create(:winery) }
  Given(:wine) { create(:wine) }

  describe "index" do

    Given { get :index }
    
    describe "success" do 

      Then { assert_response :success }
      And { assert_not_nil assigns(:wines) }
    end 
  end

  describe "new" do
    
    Given { get :new, winery_id: wine.winery.id }
    
    Then { assert_response :success }
    And { assert_not_nil assigns(:wine) }
  end

  describe "create" do
    
    describe "wine and redirect to parent winery" do

      When(:wine_attrs) { attributes_for(:wine, winery_id: winery.id) }
      Then { 
        assert_difference('Wine.count') { 
        post :create, wine: wine_attrs } 
      }
      And { assert_redirected_to wine_path(assigns(:wine)) }
    end
  end

  describe "show" do
    
    describe "a winery's wine" do 

      Given { get :show, id: wine.id }
      
      Then { assert_response :success }
      And { assert_not_nil assigns(:wine) }
      And { assert_not_nil assigns(:reviews) }
      And { assert_not_nil assigns(:winemakers) }
      And { assert_not_nil assigns(:review) }
      And { assert_not_nil assigns(:vineyards) }

    end

    describe "assigns the wine's fruit lots" do 

      # Given(:wine) { create(:showcase_with_wines) } 
      # Given { get :show, id: showcase_with_wines.id }
      # Then { assert_not_nil assigns(:showcase) }
    end
  end

  # describe "edit" do

  #   When { get :edit, id: showcase.id }
  #   Then { assert_response :success }
  # end

  # describe "update" do
    
  #   # When(:desired_attrs) { showcase: { name: "new name" }}}  # When(:showcases_wine_attrs) { attributes_for(:showcases_wine) }
  #   # Given { put :update, id: showcase, showcase: { name: "new name" } }
  #   # Then { assert_redirected_to showcase }

  #   # describe "must create showcase wines" do 
  #   #   Given(:wine) { create(:wine) }
  #   #   Given { put :update, id: showcase, showcase: { wines_attributes: wine.id }  }
  #   #   Then { }# Then { showcase.wines.must include wine }
  #   # end
  # end

  # # describe "must destroy showcase" do

  # #   Then { assert_difference('Showcase.count', -1) {
  # #     delete :destroy, id: showcase.id } }
  # #   And { assert_redirected_to showcases_path }
  # end
end
