require 'spec_helper'

describe FruitLot do

	describe "database" do 

		describe "columns" do 

			%w[created_at updated_at].each do |column|
        it { should have_db_column(column.to_sym).of_type(:datetime) }
      end

      %w[wine_id vineyard_vintage_id].each do |column|
      	it { should have_db_column(column.to_sym).of_type(:integer) }
      end

      %w[brix weight].each do |column|
      	it { should have_db_column(column.to_sym).of_type(:decimal) }
      end

      it { should have_db_column(:harvest_date).of_type(:date) }
		end
	end

	describe "associations" do 

    it { should belong_to(:vineyard_vintage) }
	end
end
