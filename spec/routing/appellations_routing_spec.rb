require "spec_helper"

describe AppellationsController do
  describe "routing" do

    it "routes to #index" do
      get("/appellations").should route_to("appellations#index")
    end

    it "routes to #new" do
      get("/appellations/new").should route_to("appellations#new")
    end

    it "routes to #show" do
      get("/appellations/1").should route_to("appellations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/appellations/1/edit").should route_to("appellations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/appellations").should route_to("appellations#create")
    end

    it "routes to #update" do
      put("/appellations/1").should route_to("appellations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/appellations/1").should route_to("appellations#destroy", :id => "1")
    end

  end
end
