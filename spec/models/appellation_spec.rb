require 'spec_helper'

describe Appellation do

	describe "database" do

		describe "columns" do 

			%w[name type map].each do |column|

				it { should have_db_column(column.to_sym).of_type(:string) }
			end
		end

		describe "indexes" do 

			it { should have_db_index([:name, :type]).unique(true) }

		end
	end
end
