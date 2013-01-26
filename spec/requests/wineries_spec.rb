require 'spec_helper'

describe "Wineries" do


  describe "GET /wineries" do
    
    When { get wineries_path }
    Then { response.status.should be(200) }
  end
  
  Given!(:winery) { FactoryGirl.create(:winery) }

  describe "GET /wineries/:id" do 
    # Given { FactoryGirl.create(:winery) }
    When { get winery_path(winery.id) }
    Then { response.status.should be(200) }





  end
end
