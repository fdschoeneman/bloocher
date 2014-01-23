require "test_helper"

describe AccountsController do
  def url_for_subdomain subdomain="www", path="/"
    "http://#{subdomain}.127.0.0.1.xip.io:#{Capybara.server_port}#{path}"
  end
  Given(:account) { create(:account) }

  describe "index" do 

    When { get :index }
    Then { assert_response :success }
    # And { assert_not_nil assigns(:accounts) }
  end

  describe "accountable_redirects" do 
    
    Given(:account) { create(:account) }
    Given { request.accept = 'application/json' }
    Given { request.host = "#{account.subdomain}.127.0.0.1.xip.io"}    
    # Given(:subdomain) { account.subdomain }
    # Given { @request.host = "#{account.subdomain}.example.com" }
    When { get :accountable_redirect }
    # Then { assert_response :redirect }
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
