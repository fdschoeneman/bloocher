require 'test_helper'

class VineyardTest < ActiveSupport::TestCase 

  subject { Vineyard.new }

  describe "db" do 

    describe "columns and types" do 

      %w[created_at updated_at
        ].each do |column|
        it { must have_db_column(column.to_sym).of_type(:datetime) }
      end

      %w[name soil_composition topo_aspect soil_composition 
        soil_drainage climate varietal clone rootstock irrigation
        ].each do |column|
        it { must have_db_column(column.to_sym).of_type(:string) }
      end

      it { must have_db_column(:soil_fertility).of_type(:decimal).
        with_options(:scale => 2)}
      it { must have_db_column(:soil_ph).of_type(:decimal).
        with_options(:scale => 2)}

      %w[appellation_id producer_id topo_slope topo_elevation seasonal_days_of_rain 
        avg_seasonal_humidity days_over_100 growing_deg_days 
        growing_season_length winter_min_temp planted_on grafted_on]
      it { must have_db_column(:producer_id).of_type(:integer) }
    end

    describe 'indexes' do 

      it { must have_db_index(:name)}
      it { must have_db_index(:appellation_id) }
    end
  end

  describe "validations" do

    %w[name producer_id].each do |attribute|
      it { must validate_presence_of(attribute.to_sym) }
    end
  end

  describe "associations" do

    it { must have_many(:wines).through(:fruit_lots) } 
    it { must have_many(:blocks).class_name("Vineyard") } 
    it { must have_many(:fruit_lots).through(:vineyard_vintages) } 
    it { must have_many(:vineyard_vintages) } 
    it { must have_many(:appellations_vineyards)}
    it { must have_many(:appellations).through(:appellations_vineyards) }
    it { must belong_to(:vineyard_parent) } 
    it { must belong_to(:producer) } 
    it { must accept_nested_attributes_for(:producer)}
  end

  describe "methods" do 

    # xit { must respond_to(:vineyard_rating) }
  end
end
