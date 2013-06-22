require 'spec_helper'

describe Wine do
  
  describe "columns" do
    
    %w[vintage cases_produced winery_id days_in_oak 
      drink_before lay_down_until].each do |column|
      it { should have_db_column(column.to_sym).of_type(:integer) }
    end

    %w[created_at updated_at bottled_on released_on].each do |column|
      it { should have_db_column(column.to_sym).of_type(:datetime) }
    end

    %w[ph alcohol new_french_oak one_yr_old_french_oak two_yr_old_french_oak
      three_yr_old_french_oak new_american_oak one_yr_old_american_oak
      two_yr_old_american_oak three_yr_old_american_oak].each do |column|
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
      %w[bottled_on released_on lay_down_until drink_before ph acid_added 
        vintage name winemaker_notes cases_produced new_french_oak 
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

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:vintage) }
    it { should validate_numericality_of(:vintage) }
    it { should ensure_inclusion_of(:vintage).in_array(["1972", "2013"]) }
    it { should ensure_exclusion_of(:vintage).in_array([
      "sixty-two", "99999", "2", "last year", "20153"]).with_message(
      /should be a year/
    ) }

    %w[vintage cases_produced].each do |attribute|
      it { should validate_numericality_of(attribute.to_sym) }
    end

  end

  describe "associations" do 
    
    it { should belong_to(:winery) }
    it { should have_many(:reviews) }
    it { should have_many(:winemaker_oeuvres) }
    it { should have_many(:winemakers).class_name("User").through(:winemaker_oeuvres) }
    it { should have_many(:fruit_lots) }
    it { should have_many(:vineyard_vintages).through(:fruit_lots) }
    it { should have_many(:vineyards).through(:vineyard_vintages) }
  end

  describe "methods" do 

    it { should respond_to(:reviews) }
    it { should respond_to(:rating) }
    it { should respond_to(:winemaker_oeuvres) }
    it { should respond_to(:fruit_lots) }
    it { should respond_to(:vineyards) }
  end

  describe "vineyards method" do 

    Given(:wine) { FactoryGirl.create(:wine) }
    Given(:vineyard) { FactoryGirl.create(:vineyard) }

    context "should show a wine's contributing vineyards" do

      When(:vineyard_vintage) do 
        FactoryGirl.create(:vineyard_vintage, vineyard_id: vineyard.id) 
      end

      When(:fruit_lot) do 
        FactoryGirl.create(:fruit_lot, 
          vineyard_vintage_id: vineyard_vintage.id
        ) 
      end
      
      When(:wine_fruit_lot) do 
        FactoryGirl.create(:wine_fruit_lot,
          fruit_lot_id: fruit_lot.id,
          wine_id: wine.id
        )
      end

      Then { wine.vineyards.should include(vineyard) } 
    end
  end
end
