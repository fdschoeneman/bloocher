require 'spec_helper'

describe "Vineyards" do
  describe "GET /vineyards" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vineyards_path
      response.status.should be(200)
    end
  end
end
