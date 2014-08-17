require 'test_helper'

describe Winery do  

  subject { Winery.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:history).of_type(:text) }
      must { have_db_column(:mission).of_type(:text) }
      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:producer_id).of_type(:integer) }
      must { have_db_column(:slug).of_type(:string) }

    end

    describe 'indexes' do 

      must { have_db_index(:name).unique(true) }
      must { have_db_index(:slug).unique(true) }
      must { have_db_index(:producer_id) }
    end
  end

  describe "validations" do

    must { validate_presence_of(:name) }
    must { validate_uniqueness_of(:name) }
  end

  describe "associations" do

    must { belong_to(:producer) } 
    
    must { have_many(:addresses_addressable) }
    must { have_many(:addresses).through(:addresses_addressable) }
    must { have_many(:accounts) }
    must { have_many(:carousels) }
    must { have_many(:certifications_holdables) }
    must { have_many(:certifications).through(:certifications_holdables) }
    must { have_many(:images) } 
    must { have_many(:reviews).through(:wines) }
    must { have_many(:showcases) }
    must { have_many(:positions) }
    must { have_many(:wines) } 
  end

  Given(:winery) { FactoryGirl.create(:winery) }
  
  describe "ratings" do 

    Given(:wine) { FactoryGirl.create(:wine, winery_id: winery.id) }
    Given(:second_wine) { FactoryGirl.create(:wine, winery_id: winery.id) }

    describe "winery rating when there are" do 
  
      Given!(:three_reviews) do 
        
        %w[85 90 95].each do |rating| 
          FactoryGirl.create(:review, rating: rating, wine_id: wine.id)
        end

        context "three reviews of a single wine" do
        
          # Then { winery.winery_rating.must eq 90}
        end
      end

      describe "three reviews of one and one review of another" do 

        Given(:fourth_review) { create(:review, rating: 50, wine_id: second_wine.id) }  
        # Then { assert_equal winery.winery_rating, 80 }
      end
    end
  end

  Given(:pinot_2012) { create(:wine, vintage: "2012", winery_id: winery.id) }
  Given(:pinot_2013) { create(:wine, vintage: "2013", winery_id: winery.id) }
  Given(:pinot_2014) { create(:wine, vintage: "2014", winery_id: winery.id) }
  Given(:gewurz_2012) { 
    create(
      :wine, vintage: "2012", winery_id: winery.id, name: "ferrington gewurz"
    ) 
  }
  Given(:gewurz_2013) { create(:wine, vintage: "2013", winery_id: winery.id, name: "ferrington gewurz") }
  Given(:gewurz_2014) { create(:wine, vintage: "2014", winery_id: winery.id, name: "ferrington gewurz") }
  
  describe "vintages" do 
    Given { 
      pinot_2012 
      pinot_2013
      pinot_2014
      gewurz_2012
      gewurz_2013
      gewurz_2014
    }
    
    Then { winery.wines.count.must_equal 6 }
    And { winery.vintages.count.must_equal 3 }
  end

  describe "verticals" do 

  end
end
