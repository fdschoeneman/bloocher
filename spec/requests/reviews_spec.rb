require 'spec_helper'

describe "Reviews" do

  describe "GET /reviews" do

    it "should be successful" do 
      get reviews_path
      response.status.should be(200)
    end

    it "should list the name of the wine" do 


    end
  end

end
