require 'spec_helper'

describe WineFruitLot do

	describe "database" do 

		it { should have_db_column(:wine_id) }
		it { should have_db_column(:fruit_lot_id) }
		it { should have_db_column(:percent_of_wine) }
	end

	describe "assocations" do 

		it { should belong_to(:fruit_lot) }
		it { should belong_to(:wine) }
	end
end
