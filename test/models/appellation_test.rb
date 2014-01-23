require 'test_helper'

describe Appellation do 

  subject { Appellation.new }

  describe "db" do 
    
    describe "columns and types" do 

      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:type).of_type(:string) }
      must { have_db_column(:description).of_type(:text) }
      must { have_db_column(:map).of_type(:string) }
    end

    describe "indexes" do 

      must { have_db_index([:name, :type]).unique(true) }
    end
  end

  describe "associations" do

    must { have_many(:appellations_vineyards) }
  end
end