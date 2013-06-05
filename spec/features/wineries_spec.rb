require 'spec_helper'

describe "Wineries" do

  Given!(:winery) { FactoryGirl.create(:winery) }
  
  describe "for logged out user" do 
    
    When { logout }

    describe "should show existing winery" do 

      When { visit wineries_path }

      describe "but not link to new winery" do 

        Then { page.should_not have_link("New Winery") }
      end
    end
  end

  describe "for logged in user" do 
    
    Given { login_as FactoryGirl.create(:user) }
    
    describe "should show existing winery" do 
      
      When { visit wineries_path }
      Then { page.should have_link(winery.name)}

      describe "but not link to new winery" do 

        Then { page.should_not have_link("New Winery") }
      end
    end

    describe "request for new winery path should redirect to login" do

      xit

    end
  end

  describe "for logged in admin" do 
    
    Given { login_as FactoryGirl.create(:admin) } 

    describe "should show existing winery" do 
      
      When { visit wineries_path }
      Then { page.should have_link(winery.name)}
      
      describe "and link to new winery" do 

        Then { page.should have_link("New Winery") }
      end
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

  #   describe "should provide an average rating for all wines" do
       
  #   end

  #   describe "should provide a list of vineyard partners" do
  #   end
  end
end
