require "test_helper"

describe AccountsActivation do
  
  subject { AccountsActivation.new }

  describe "db" do 

    describe "columns and types" do 
  
      must { have_db_column(:account_id).of_type(:integer) }
      must { have_db_column(:activation_id).of_type(:integer) }
    end

    describe "indexes" do 
      must { have_db_index(:account_id)}
      must { have_db_index(:activation_id)}
    end
  end

  describe "associations" do 

    must { belong_to(:account) }
    must { belong_to(:activation) } 
  end
end
