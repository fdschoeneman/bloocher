require "test_helper"

describe AccountsAdmin do

  subject { AccountsAdmin.new }

  describe "db" do 

  	describe "columns and types" do 

  		it { must have_db_column(:user_id).of_type(:integer) }
  		it { must have_db_column(:account_id).of_type(:integer) }
  	end
  end

  describe "associations" do 

    it { must belong_to(:user) }
    it { must belong_to(:account) }
  end
end
