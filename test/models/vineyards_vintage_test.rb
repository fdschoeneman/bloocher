require "test_helper"

describe VineyardsVintage do
  
  subject { VineyardsVintage.new }

  describe "db" do 

    describe "columns and types" do 
  
      it { must have_db_column(:vineyard_id).of_type(:integer) }
    end
  end

  describe "associations" do 

  end
end
