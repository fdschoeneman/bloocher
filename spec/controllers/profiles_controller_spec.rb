require 'spec_helper'

describe ProfilesController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    xit "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

end
