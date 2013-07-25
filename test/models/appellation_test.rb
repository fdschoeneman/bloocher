require 'test_helper'

class AppellationTest < ActiveSupport::TestCase 

  subject { Appellation.new }

  describe "db" do 
    
    describe "columns and types" do 

      it { must have_db_column(:name).of_type(:string) }
      it { must have_db_column(:type).of_type(:string) }
      it { must have_db_column(:map).of_type(:string) }
      it { must have_db_column(:description).of_type(:text) }
    end

    describe "indexes" do 

      it { must have_db_index([:name, :type]).unique(true) }
    end
  end

  describe "associations" do

    it { must have_many(:appellations_vineyards) }
  end
end