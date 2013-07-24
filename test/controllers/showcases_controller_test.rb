require "test_helper"

describe ShowcasesController do

  Given!(:showcase) { FactoryGirl.create(:showcase) }

  describe "must get index" do

    When { get :index }
    Then { assert_response :success }
    And { assert_not_nil assigns(:showcases) }
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  # it "must create showcase" do
  #   assert_difference('Showcase.count') do
  #     post :create, showcase: {  }
  #   end

  #   assert_redirected_to showcase_path(assigns(:showcase))
  # end

  # it "must show showcase" do
  #   get :show, id: @showcase
  #   assert_response :success
  # end

  # it "must get edit" do
  #   get :edit, id: @showcase
  #   assert_response :success
  # end

  # it "must update showcase" do
  #   put :update, id: @showcase, showcase: {  }
  #   assert_redirected_to showcase_path(assigns(:showcase))
  # end

  # it "must destroy showcase" do
  #   assert_difference('Showcase.count', -1) do
  #     delete :destroy, id: @showcase
  #   end

  #   assert_redirected_to showcases_path
  # end

end
