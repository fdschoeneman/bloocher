require 'spec_helper'

describe "Blocks" do
  
  describe "GET /blocks" do
  
    describe "success" do 

      When { visit blocks_path }
      Then { page.title.should =~ /Blocks/ } 
    end
  end
end
