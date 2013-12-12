require 'test_helper'

describe FruitLotsWine do 

  subject { FruitLotsWine.new }

  describe "db" do 

    describe "columns and types" do 
    
      must { have_db_column(:wine_id).of_type(:integer) }
      must { have_db_column(:fruit_lot_id).of_type(:integer) }
      must { have_db_column(:percent_of_wine).of_type(:integer) }
    end

    describe "indexes" do

      must { have_db_index(:wine_id) }
      must { have_db_index(:fruit_lot_id) }
    end
  end

  describe "validations" do
  end

  describe "associations" do 
    
    must { belong_to(:fruit_lot) }
    must { belong_to(:wine) }
  end
end
