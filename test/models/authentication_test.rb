require "test_helper"

describe Authentication do 

  subject { Authentication.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:provider).of_type(:string) }
      must { have_db_column(:uid).of_type(:string) }
      must { have_db_column(:user_id).of_type(:integer) }
    end

    describe "indexes" do 

      must { have_db_index(:user_id) }
    end 
  end

  describe "associations" do 

    must { belong_to :user }
  end
end
