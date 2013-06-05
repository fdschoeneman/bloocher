require 'spec_helper'

describe "Wines" do

  Given(:review) { FactoryGirl.create(:review) }
  Given(:winemaker) { FactoryGirl.create(:winemaker_oeuvre) }

  describe "index" do 

    When { visit wines_path }
    Then { page.title.should =~ /Wines/ }
  end

  describe "show" do 

    When { visit wine_path(review.wine_id) }
    Then { page.title.should include "#{review.wine.name}" }
  end

  describe "wine page" do 
    
    When { visit wine_path(review.wine_id) }

    Then { page.should have_content(review.content) }
    Then { page.should have_link(review.reviewer.name) }
  end
end
