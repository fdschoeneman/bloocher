require 'test_helper'

describe Wine do 

  subject { Wine.new }

  describe "db" do 

    describe "columns and types" do 
    
      must { have_db_column(:bottled_on).of_type(:datetime) }
      must { have_db_column(:cases_produced).of_type(:integer) }
      must { have_db_column(:days_in_oak).of_type(:integer) }
      must { have_db_column(:drink_before).of_type(:integer) }
      must { have_db_column(:lay_down_until).of_type(:integer) }
      must { have_db_column(:released_on).of_type(:datetime) }
      must { have_db_column(:slug).of_type(:string) }
      must { have_db_column(:vintage).of_type(:integer) }
      must { have_db_column(:winery_id).of_type(:integer) }



      %w[ph alcohol new_french_oak one_yr_old_french_oak two_yr_old_french_oak
        three_yr_old_french_oak new_american_oak one_yr_old_american_oak
        two_yr_old_american_oak three_yr_old_american_oak].each do |column|
        must { have_db_column(column.to_sym).of_type(:decimal) }
      end

      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:slug).of_type(:string) }
      must { have_db_column(:short_url).of_type(:string) }
      must { have_db_column(:winemaker_notes).of_type(:text) }
      must { have_db_column(:acid_added).of_type(:boolean) }
    end

    describe "indexes" do

      must { have_db_index(:name) }
      must { have_db_index(:vintage) }
      must { have_db_index(:winery_id) }
    end
  end

  describe "validations" do

    must { validate_presence_of(:name) }
    must { validate_presence_of(:vintage) }
    must { validate_numericality_of(:vintage) }
    must { ensure_inclusion_of(:vintage).in_array(["1972", "2013"]) }
    # must { ensure_exclusion_of(:vintage).in_array([
    #   "sixty-two", "99999", "2", "last year", "20153"]).with_message(
    #   /must be a year/
    # ) }

    %w[vintage cases_produced].each do |attribute|
      must { validate_numericality_of(attribute.to_sym) }
    end

  end

  describe "associations" do 
    
    must { belong_to(:winery) }

    must { have_many(:images) }
    must { have_many(:carousels) }
    must { have_many(:certifications_holdables) }
    must { have_many(:certifications).through(:certifications_holdables) }
    must { have_many(:positions) }
    must { have_many(:fruit_lots) }
    must { have_many(:reviews) }
    must { have_many(:showcases).through(:showcases_wines)}
    must { have_many(:vineyards_vintages).through(:fruit_lots) }
    must { have_many(:vineyards).through(:vineyards_vintages) }
  end

  describe "vineyards method" do 

    Given(:wine) { FactoryGirl.create(:wine) }
    Given(:vineyard) { FactoryGirl.create(:vineyard) }

    context "must show a wine's contributing vineyards" do

      When(:vineyard_vintage) do 
        FactoryGirl.create(:vineyard_vintage, vineyard_id: vineyard.id) 
      end

      When(:fruit_lot) do 
        FactoryGirl.create(:fruit_lot, 
          vineyard_vintage_id: vineyard_vintage.id
        ) 
      end
      
      When(:wines_fruit_lot) do 
        FactoryGirl.create(:wines_fruit_lot,
          fruit_lot_id: fruit_lot.id,
          wine_id: wine.id
        )
      end

      # Then { wine.vineyards.must include(vineyard) } 
    end
  end
end
