require 'test_helper'

describe Vineyard do
 
  subject { Vineyard.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:appellation_id).of_type(:integer) }
      must { have_db_column(:climate).of_type(:string) }
      must { have_db_column(:clone).of_type(:string) }
      must { have_db_column(:grafted_on).of_type(:integer) }
      must { have_db_column(:history).of_type(:text) }
      must { have_db_column(:irrigation).of_type(:string) }
      must { have_db_column(:mission).of_type(:text) }
      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:planted_on).of_type(:integer) }
      must { have_db_column(:producer_id).of_type(:integer) }
      must { have_db_column(:rootstock).of_type(:string) }
      must { have_db_column(:soil_composition).of_type(:string) }
      must { have_db_column(:soil_drainage).of_type(:string) }
      must { have_db_column(:soil_fertility).of_type(:decimal).
        with_options(:scale => 2)}
      must { have_db_column(:soil_ph).of_type(:decimal).
        with_options(:scale => 2)}
      must { have_db_column(:topo_aspect).of_type(:string) }
      must { have_db_column(:topo_elevation).of_type(:integer) }
      must { have_db_column(:topo_slope).of_type(:integer) }
      must { have_db_column(:varietal).of_type(:string) }
      must { have_db_column(:vineyard_parent_id).of_type(:integer) }
    end

    describe 'indexes' do 

      must { have_db_index(:appellation_id) }
      must { have_db_index(:name)}
      must { have_db_index(:producer_id) }
      must { have_db_index(:vineyard_parent_id) }
    end
  end

  describe "validations" do

    must { validate_presence_of(:name) }
    must { validate_presence_of(:producer_id) }
  end

  describe "associations" do

    must { belong_to(:producer) }
    must { belong_to(:vineyard_parent) } 

    must { have_many(:accounts) }
    must { have_many(:addresses_addressable) }
    must { have_many(:addresses).through(:addresses_addressable) }
    must { have_many(:appellations_vineyards)}
    must { have_many(:appellations).through(:appellations_vineyards) }
    must { have_many(:blocks).class_name("Vineyard") } 
    must { have_many(:carousels) }
    must { have_many(:certifications_holdables) }
    must { have_many(:certifications).through(:certifications_holdables) }

    must { have_many(:fruit_lots).through(:vineyards_vintages) } 
    must { have_many(:images) }
    must { have_many(:positions) }
    must { have_many(:showcases) }
    must { have_many(:vineyards_vintages) } 
    must { have_many(:wines).through(:fruit_lots) } 
    must { accept_nested_attributes_for(:producer)}
  end

  describe "appellation methods" do 

    Given(:vineyard) { create(:vineyard) }
    Given(:appellation) { create(:appellation) }

    describe "add_appellation!" do 

      Given { vineyard.add_appellation!(appellation) }
      Then { vineyard.appellations.must_include appellation }

      describe "in_appellation? wont return nil" do 

        Then { vineyard.in_appellation?(appellation).wont_equal nil }
      end
    end

    describe "remove_appellation" do 

      Given { AppellationsVineyard.create(appellation_id: appellation.id, vineyard_id: vineyard.id) }
      Given { vineyard.remove_appellation!(appellation) }
      Then { vineyard.appellations.wont_include appellation }
    
      describe "in_appellation? is false" do 
        Then { vineyard.in_appellation?(appellation).must_equal nil }
      end

    end
  end
end
