require "test_helper"

describe ApplicationHelper do

  include Rails.application.routes.url_helpers

  describe :title do 

    it "without @page_title set" do
      
      title.must_equal "Bloocher" 
    end

    it "with @page_title set" do 

      @page_title = "test"
      title.must_equal "Bloocher | test"
    end
    
    it "When on the artists controller" do
      
        # self.stubs(:controller).returns(ArtistsController.new)
      
      title.must_equal "Bloocher"
      # @link = nav_link_to(home, root_url)
    end
  end

  describe "link helpers" do 

  end
end
