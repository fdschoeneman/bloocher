require 'spec_helper'

describe Winery do

  describe 'database' do 

    describe 'columns' do 

      %w[created_at updated_at
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:datetime) }
      end

      it { should have_db_column(:name).of_type(:string) }

      it { should have_db_column(:producer_id).of_type(:integer) }
    end

    describe 'indexes' do 

      it { should have_db_index(:name).unique(true) }
    end
  end

  describe 'security' do 

    describe 'mass assignable' do 

      %w[producer_id name].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe 'protected' do 

      %w[winery_id created_at updated_at].each do |attribute|
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

    it { should have_many(:wines) } 
    it { should accept_nested_attributes_for(:producer)}
    it { should belong_to(:producer) } 


  end



end
