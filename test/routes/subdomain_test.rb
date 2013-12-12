require "test_helper"

describe "polymorphic subdomain routes Acceptance Test" do

  it "resolves the homepage" do
    assert_routing "/", :controller => "static", :action => "home"
  end

  it "generates a winery url" do 
    assert_generates '/wineries/1', { controller: 'wineries', action: 'show', id: '1' }
  end

  it "generates a static page" do 
    assert_generates '/about', controller: 'static', action: 'about'
  end

  it "recognizes a route" do 
    assert_recognizes({ controller: 'wineries', action: 'show', id: '1' }, '/wineries/1')
  end

  it "recognizes a route via POST method" do 
    assert_routing({ path: 'wineries', method: :post }, { controller: 'wineries', action: 'create' })
  end

  it "recognizes a subdomain" do 
    assert_routing "http://vineyard-1.bloocher.com", controller: "accounts", :action => "accountable_redirect"
  end
end