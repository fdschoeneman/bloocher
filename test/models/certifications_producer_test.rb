require 'test_helper'

describe CertificationsProducer do 

  subject { CertificationsProducer.new }

  describe "db" do 

    describe "columns and types" do 

  		it { must have_db_column(:certification_id).of_type(:integer) }
  		it { must have_db_column(:producer_id).of_type(:integer) }
  		it { must have_db_column(:certified_since).of_type(:date) }
  	end
  end

	describe "associations" do 

		it { must belong_to(:producer) }
		it { must belong_to(:certification) }
	end
end
