require "test_helper"

describe Authentication do 
  subject { Authentication.new }

  describe "db" do 

    describe "columns and types" do 

      it { must have_db_column(:provider).of_type(:string) }
      it { must have_db_column(:uid).of_type(:string) }
      it { must have_db_column(:user_id).of_type(:integer) }
    end
  end

  describe "associations" do 

    it { must belong_to :user }
  end
end
