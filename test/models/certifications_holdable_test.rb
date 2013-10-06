require "test_helper"

describe CertificationsHoldable do

	subject { CertificationsHoldable.new }

	describe "db" do 

		describe "columns and types" do 

			it { must have_db_column(:certification_id).of_type(:integer) }
			it { must have_db_column(:inception).of_type(:date) }
			it { must have_db_column(:holdable_id).of_type(:integer) }
			it { must have_db_column(:holdable_type).of_type(:string) }
			it { must have_db_column(:grade).of_type(:string) }
		end

		describe "indexes" do 

			it { must have_db_index([:holdable_id, :holdable_type]) }
		end
	end

	describe "associations" do 

		it { must belong_to(:certification) }
		it { must belong_to(:holdable) }

	end
end
