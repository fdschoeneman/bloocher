require 'test_helper'

class FruitLotTest < ActiveSupport::TestCase 

  subject { FruitLot.new }

  describe "db" do 

		describe "columns and types" do 

      it { must have_db_column(:wine_id).of_type(:integer) }
      it { must have_db_column(:vineyard_vintage_id).of_type(:integer) }
      it { must have_db_column(:brix).of_type(:decimal) }
      it { must have_db_column(:harvest_date).of_type(:date) }
		end
	end

	describe "associations" do 

    it { must belong_to(:vineyard_vintage) }
    it { must have_many(:wine_fruit_lots) }
    it { must have_many(:wines).through(:wine_fruit_lots) }
	end
end
