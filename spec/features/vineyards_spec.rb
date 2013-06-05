require 'spec_helper'

describe "Vineyards" do
  
  describe "GET /vineyards" do
    
    describe "success" do

      When { visit vineyards_path }
      Then { page.title.should =~ /Vineyards/ }
    end
  end
end
