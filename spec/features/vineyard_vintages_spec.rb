require 'spec_helper'

describe "VineyardVintages" do
  describe "GET /vineyard_vintages" do
    
    describe "success" do

      When { visit vineyard_vintages_path }
      Then { page.title.should =~ /vintages/ }
    end
  end
end
