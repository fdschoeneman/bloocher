require 'spec_helper'

describe Wine do
  
  describe "columns" do
    
    %w[vintage cases_produced].each do |column|
      it { should have_db_column(column.to_sym).of_type(:integer) }
    end

    %w[created_at updated_at].each do |column|
      it { should have_db_column(column.to_sym).of_type(:datetime) }
    end

    it { should have_db_column(:name).of_type(:string) }

    it { should have_db_column(:winemaker_notes).of_type(:text) }
  end

  describe "indexes" do

    it { should have_db_index(:vintage) }
  end

  describe "security" do

    describe "mass assignable" do 

      %w[vintage name winemaker_notes cases_produced
      ].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe "protected" do 

      %w[created_at updated_at
      ].each do |attribute|
        it {should_not allow_mass_assignment_of(attribute.to_sym) }
      end
    end
  end

  describe "validations" do

    %w[name vintage].each do |attribute|
      it { should validate_presence_of(attribute.to_sym) }
    end
  end
end
