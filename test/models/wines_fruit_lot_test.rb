require 'test_helper'

describe WinesFruitLot do 

  subject { WinesFruitLot.new }

  describe "db" do 

    describe "columns and types" do 
    
      it { must have_db_column(:wine_id).of_type(:integer) }
      it { must have_db_column(:fruit_lot_id).of_type(:integer) }
      it { must have_db_column(:percent_of_wine).of_type(:integer) }
    end

    describe "indexes" do

      it { must have_db_index(:wine_id) }
      it { must have_db_index(:fruit_lot_id) }
    end
  end

  describe "validations" do
  end

  describe "associations" do 
    
    it { must belong_to(:fruit_lot) }
    it { must belong_to(:wine) }
  end
end
