require 'spec_helper'

describe "Wines" do

  Given(:review) { FactoryGirl.create(:review) }
  Given(:winemaker) { FactoryGirl.create(:winemaker_oeuvre) }

  describe "index" do 

    When { get wines_path }
    Then { response.status.should be(200) }
  end

  describe "show" do 

    When { get wine_path(review.wine_id) }
    Then { response.status.should be(200) }
  end

  describe "wine page" do 
    
    When { visit wine_path(review.wine_id) }

    Then { page.should have_content(review.content) }
    Then { page.should have_link(review.reviewer.name) }
  end
end
