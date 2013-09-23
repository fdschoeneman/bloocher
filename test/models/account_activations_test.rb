require "minitest_helper"

describe AccountActivations do
  before do
    @account_activations = AccountActivations.new
  end

  it "must be valid" do
    @account_activations.valid?.must_equal true
  end
end
