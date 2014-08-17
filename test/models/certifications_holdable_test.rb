require "test_helper"

describe CertificationsHoldable do

	subject { CertificationsHoldable.new }

	describe "db" do 

		describe "columns and types" do 

			must { have_db_column(:certification_id).of_type(:integer) }
			must { have_db_column(:inception).of_type(:date) }
			must { have_db_column(:holdable_id).of_type(:integer) }
			must { have_db_column(:holdable_type).of_type(:string) }
			must { have_db_column(:grade).of_type(:string) }
		end

		describe "indexes" do 

			must { have_db_index([:holdable_id, :holdable_type]) }
		end
	end

	describe "associations" do 

		must { belong_to(:certification) }
		must { belong_to(:holdable) }
		must { belong_to(:vineyard) }

	end
end
