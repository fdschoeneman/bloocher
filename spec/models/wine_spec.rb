require 'spec_helper'

describe Wine do
  
  describe "columns" do
    
    %w[vintage cases_produced winery_id].each do |column|
      it { should have_db_column(column.to_sym).of_type(:integer) }
    end

    %w[created_at updated_at bottled_on released_on].each do |column|
      it { should have_db_column(column.to_sym).of_type(:datetime) }
    end

    %w[].each do |column|
      it { should have_db_column(column.to_sym).of_type(:decimal) }
    end


    it { should have_db_column(:name).of_type(:string) }

    it { should have_db_column(:winemaker_notes).of_type(:text) }
    it { should have_db_column(:acid_added).of_type(:boolean) }
  end

  describe "indexes" do

    it { should have_db_index(:vintage) }
    it { should have_db_index(:name) }
  end

  describe "security" do

    describe "mass assignable" do 
      %w[bottled_on released_on ph acid_added vintage name 
        winemaker_notes cases_produced new_french_oak 
        one_yr_old_french_oak two_yr_old_french_oak 
        three_yr_old_french_oak new_american_oak one_yr_old_american_oak
        two_yr_old_american_oak three_yr_old_american_oak
      ].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe "protected" do 

      %w[wine_id created_at updated_at
      ].each do |attribute|
        it {should_not allow_mass_assignment_of(attribute.to_sym) }
      end
    end
  end

  describe "validations" do

    %w[name winery_id vintage].each do |attribute|
      it { should validate_presence_of(attribute.to_sym) }
    end

    %w[vintage cases_produced].each do |attribute|
      it { should validate_numericality_of(attribute.to_sym) }
    end

  end

  describe "associations" do 
    it { should belong_to(:winery) }
  end

end
