require 'spec_helper'

describe CertificationsProducer do

	describe "database" do 

		it { should have_db_column(:certification_id).of_type(:integer) }
		it { should have_db_column(:producer_id).of_type(:integer) }
		it { should have_db_column(:certified_since).of_type(:date) }
	end

	describe "associations" do 

		it { should belong_to(:producer) }
		it { should belong_to(:certification) }
	end
end
