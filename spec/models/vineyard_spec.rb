require 'spec_helper'

describe Vineyard do

  describe 'database' do 

    describe 'columns' do 

      %w[created_at updated_at
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:datetime) }
      end

      %w[name soil_composition topo_aspect soil_composition 
        soil_drainage climate varietal clone rootstock irrigation
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:string) }
      end

      it { should have_db_column(:soil_fertility).of_type(:decimal).
        with_options(:scale => 2)}
      it { should have_db_column(:soil_ph).of_type(:decimal).
        with_options(:scale => 2)}

      %w[appellation_id producer_id topo_slope topo_elevation seasonal_days_of_rain 
        avg_seasonal_humidity days_over_100 growing_deg_days 
        growing_season_length winter_min_temp planted_on grafted_on]
      it { should have_db_column(:producer_id).of_type(:integer) }
    end

    describe 'indexes' do 

      it { should have_db_index(:name)}
      it { should have_db_index(:appellation_id) }
    end
  end

  describe 'security' do 

    describe 'mass assignable' do 

      %w[producer_id name appellation soil_composition climate
        ].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe 'protected' do 

      %w[vineyard_id created_at updated_at].each do |attribute|
        it {should_not allow_mass_assignment_of(attribute.to_sym) }
      end
    end
  end

  describe "validations" do

    %w[name producer_id].each do |attribute|
      it { should validate_presence_of(attribute.to_sym) }
    end
  end

  describe "associations" do

    it { should have_many(:wines).through(:fruit_lots) } 
    it { should have_many(:blocks).class_name("Vineyard") } 
    it { should have_many(:fruit_lots).through(:vineyard_vintages) } 
    it { should have_many(:vineyard_vintages) } 
    it { should have_many(:appellations_vineyards)}
    it { should have_many(:appellations).through(:appellations_vineyards) }
    it { should belong_to(:vineyard_parent) } 
    it { should belong_to(:producer) } 
    it { should accept_nested_attributes_for(:producer)}
  end

  describe "methods" do 

    # xit { should respond_to(:vineyard_rating) }
  end
end
