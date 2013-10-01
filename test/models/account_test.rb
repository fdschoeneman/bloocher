require "test_helper"

describe Account do

	subject { Account.new }

	describe "db" do

		describe "columns and types" do 

			it { must have_db_column(:accountable_id).of_type(:integer) }
			it { must have_db_column(:accountable_type).of_type(:string) }
			it { must have_db_column(:activation_id).of_type(:integer) }
			it { must have_db_column(:subdomain).of_type(:string) }
		end

		describe "indexes" do 

			it { must have_db_index([:accountable_id, :accountable_type]).unique(true) }
			it { must have_db_index(:subdomain).unique(true) }
		end
	end

	describe "associations" do 

		it { must belong_to(:accountable) }
		it { must have_many(:activations) }
	end

	describe "validations" do 

	end

	describe "methods" do 

	end
end
