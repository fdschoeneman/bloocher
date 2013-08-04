require "test_helper"

describe DashboardController do
  
  Given(:user) { create(:user) }
  Given { login_as user }

  it "should get show" do
    get :show, id: user.id
    assert_response :success
  end

end
