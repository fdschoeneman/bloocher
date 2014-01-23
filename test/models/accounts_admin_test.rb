require "test_helper"

describe AccountsAdmin do

  subject { AccountsAdmin.new }

  describe "db" do 

  	describe "columns and types" do 

  		must { have_db_column(:admin_id).of_type(:integer) }
  		must { have_db_column(:account_id).of_type(:integer) }
  	end

    describe "indexes" do 
      must { have_db_column(:admin_id) }
      must { have_db_column(:account_id) }
    end
  end

  describe "associations" do 

    must { belong_to(:admin).class_name("User") }
    must { belong_to(:account) }
  end
end
