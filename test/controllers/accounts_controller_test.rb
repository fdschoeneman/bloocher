require "test_helper"

describe AccountsController do

  Given(:account) { create(:account) }

  describe "index" do 

    When { get :index }
    Then { assert_response :success }
    # And { assert_not_nil assigns(:accounts) }
  end

  # it "must get new" do
  #   get :new
  #   assert_response :success
  # end

  # it "must create account" do
  #   assert_difference('Account.count') do
  #     post :create, account: {  }
  #   end

  #   assert_redirected_to account_path(assigns(:account))
  # end

  # it "must show account" do
  #   get :show, id: @account
  #   assert_response :success
  # end

  # it "must get edit" do
  #   get :edit, id: @account
  #   assert_response :success
  # end

  # it "must update account" do
  #   put :update, id: @account, account: {  }
  #   assert_redirected_to account_path(assigns(:account))
  # end

  # it "must destroy account" do
  #   assert_difference('Account.count', -1) do
  #     delete :destroy, id: @account
  #   end

  #   assert_redirected_to accounts_path
  # end

end
