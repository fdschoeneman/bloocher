require 'spec_helper'

describe Vineyard do

  describe 'database' do 

    describe 'columns' do 

      %w[created_at updated_at
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:datetime) }
      end

      %w[appellation name topography soil_composition].each do |column|
        it { should have_db_column(column.to_sym).of_type(:string) }
      end

      it { should have_db_column(:producer_id).of_type(:integer) }
    end

    describe 'indexes' do 

      it { should have_db_index(:name).unique(true) }
      it { should have_db_index(appellation).unique(true) }
    end
  end

  describe 'security' do 

    describe 'mass assignable' do 

      %w[producer_id name appellation topography soil_composition climate
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
    it { should have_many(:reviews).through(:fruit_lots).source(:wines) }
    it { should accept_nested_attributes_for(:producer)}
    it { should belong_to(:producer) } 
  end

  describe "methods" do 

    it { should respond_to(:vineyard_rating) }
  end
end
