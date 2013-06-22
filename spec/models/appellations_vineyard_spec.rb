require 'spec_helper'

describe AppellationsVineyard do

	describe "database" do 

		it { should have_db_column(:vineyard_id).of_type(:integer) }
		it { should have_db_column(:appellation_id).of_type(:integer) }
	end

	describe "indexes" do 

		it { should have_db_index([:vineyard_id, :appellation_id]).unique(true) }
	end
end
