require "test_helper"

describe AccountsAdmin do

  subject { AccountsAdmin.new }

  describe "db" do 

  	describe "columns and types" do 

  		it { must have_db_column(:user_id).of_type(:integer) }
  		it { must have_db_column(:account_id).of_type(:integer) }
  	end

  end# before do
  #   @accounts_admin = AccountsAdmin.new
  # end

  # it "must be valid" do
  #   @accounts_admin.valid?.must_equal true
  # end
end
