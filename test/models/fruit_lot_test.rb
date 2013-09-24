require 'test_helper'

describe FruitLot do 

  subject { FruitLot.new }

  describe "db" do 

		describe "columns and types" do 

      it { must have_db_column(:brix).of_type(:decimal) }
      it { must have_db_column(:weight).of_type(:decimal) }
      it { must have_db_column(:harvest_date).of_type(:date) }
      it { must have_db_column(:wine_id).of_type(:integer) }
      it { must have_db_column(:vineyards_vintage_id).of_type(:integer) }
		end
	end

	describe "associations" do 

    it { must belong_to(:vineyards_vintage) }
    it { must have_many(:wines_fruit_lots) }
    it { must have_many(:wines).through(:wines_fruit_lots) }
	end
end
