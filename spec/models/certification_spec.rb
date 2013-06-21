require 'spec_helper'

describe Certification do

	describe "database" do 

		it { should have_db_column(:name).of_type(:string) }
		it { should have_db_column(:url).of_type(:string) }
		it { should have_db_column(:description).of_type(:text) }
	end

	
end
