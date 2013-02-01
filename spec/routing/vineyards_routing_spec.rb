require "spec_helper"

describe VineyardsController do
  describe "routing" do

    it "routes to #index" do
      get("/vineyards").should route_to("vineyards#index")
    end

    it "routes to #new" do
      get("/vineyards/new").should route_to("vineyards#new")
    end

    it "routes to #show" do
      get("/vineyards/1").should route_to("vineyards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vineyards/1/edit").should route_to("vineyards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vineyards").should route_to("vineyards#create")
    end

    it "routes to #update" do
      put("/vineyards/1").should route_to("vineyards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vineyards/1").should route_to("vineyards#destroy", :id => "1")
    end

  end
end
