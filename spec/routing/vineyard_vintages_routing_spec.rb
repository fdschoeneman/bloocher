require "spec_helper"

describe VineyardVintagesController do
  describe "routing" do

    it "routes to #index" do
      get("/vineyard_vintages").should route_to("vineyard_vintages#index")
    end

    it "routes to #new" do
      get("/vineyard_vintages/new").should route_to("vineyard_vintages#new")
    end

    it "routes to #show" do
      get("/vineyard_vintages/1").should route_to("vineyard_vintages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vineyard_vintages/1/edit").should route_to("vineyard_vintages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vineyard_vintages").should route_to("vineyard_vintages#create")
    end

    it "routes to #update" do
      put("/vineyard_vintages/1").should route_to("vineyard_vintages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vineyard_vintages/1").should route_to("vineyard_vintages#destroy", :id => "1")
    end

  end
end
