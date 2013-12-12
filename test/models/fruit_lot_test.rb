require 'test_helper'

describe FruitLot do 

  subject { FruitLot.new }

  describe "db" do 

		describe "columns and types" do 

      must { have_db_column(:brix).of_type(:decimal) }
      must { have_db_column(:weight).of_type(:decimal) }
      must { have_db_column(:harvest_date).of_type(:date) }
      must { have_db_column(:wine_id).of_type(:integer) }
      must { have_db_column(:vineyards_vintage_id).of_type(:integer) }
		end

    describe "indexes" do 

      must { have_db_index(:wine_id) }
      must { have_db_index(:vineyards_vintage_id) }
    end
	end

	describe "associations" do 

    must { belong_to(:vineyards_vintage) }
    must { have_many(:fruit_lots_wines) }
    must { have_many(:wines).through(:fruit_lots_wines) }
	end
end
