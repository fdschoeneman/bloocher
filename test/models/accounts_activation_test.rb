require "test_helper"

describe AccountsActivation do
  
  subject { AccountsActivation.new }

  describe "db" do 

    describe "columns and types" do 
  
      it { must have_db_column(:account_id).of_type(:integer) }
      it { must have_db_column(:activation_id).of_type(:integer) }
    end
  end

  describe "associations" do 

    it { must belong_to(:account) }
    it { must belong_to(:activation) } 
  end
end
