require 'spec_helper'

describe "Producers" do
  
  describe "GET /producers" do
    
    describe "success" do 

    	When { visit producers_path }
    	Then { page.title.should =~ /Producers/ }
    end
  end
end
