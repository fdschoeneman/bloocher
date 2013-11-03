require "test_helper"

class HomepageRouteTest < MiniTest::Rails::ActionDispatch::IntegrationTest
  def test_homepage
    assert_routing "/", :controller => "static", :action => "home"
  end

  def test_subdomain_polymorphism

  	assert_routing "http://vineyard-1.bloocher.com", controller: "accounts", :action => "accountable_redirect"
  end
end