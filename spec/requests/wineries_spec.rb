require 'spec_helper'

describe "Wineries" do

  Given (:winery) { FactoryGirl.create(:winery) }
  
  describe "GET /wineries" do
    
    When { get wineries_path }
    Then { response.status.should be(200) }

    describe "list all wineries" do 

      Given { winery }

      When { visit wineries_path }
      Then { page.should have_link(winery.name)}
    end
  end

  describe "GET /wineries/:id" do 

    When { visit winery_path(winery.id) }
    Then { page.should have_selector('title', text: "Bloocher | #{winery.name}") }
  end

  describe "winery page should" do

    Given(:wine) { FactoryGirl.create(:wine) }

    describe "provide a link to each of the winery's wines" do 

      When { visit winery_path(wine.winery.id) }
      Then { page.should have_link(wine.name) }
    end

    Given(:review) { FactoryGirl.create(:review) }

    describe "publish reviews of the winery's wines" do 

      When { visit winery_path(review.wine.winery.id) }
      Then { within("#collapse#{review.wine.id}") {
              page.should have_content(review.content) 
      }}
    end

    describe "should provide an average rating for all wines" do
       
    end

    describe "should provide a list of vineyard partners" do
    end
  end
end
