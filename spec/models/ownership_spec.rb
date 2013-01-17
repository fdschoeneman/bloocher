require 'spec_helper'

describe Ownership do

  describe "database" do 

    describe "columns" do 

      it { should have_db_column(:owner_id).of_type(:integer) }
      it { should have_db_column(:producer_id).of_type(:integer) }
    end

    describe "indexes" do 

      it { should have_db_index(:owner_id) }
      it { should have_db_index(:producer_id) }
      it { should have_db_index([:owner_id, :producer_id]).unique(true) }
    end

  end

  describe "associations" do

    describe "with user model" do

      it { should belong_to(:owner).class_name("User") }
      it { should belong_to(:producer) }
    end
  end

  describe "methods" do 

    it { should respond_to(:owner) }
    it { should respond_to(:producer) }
  end
end
