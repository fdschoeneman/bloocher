require "test_helper"

describe Showcase do

  subject { Showcase.new }

  describe "db" do 

    describe "columns and types" do 
  
      must { have_db_column(:description).of_type(:text) }
      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:published).of_type(:boolean) }
      must { have_db_column(:slug).of_type(:string) }
      must { have_db_column(:showcaseable_id).of_type(:integer) }
      must { have_db_column(:showcaseable_type).of_type(:string) }
      must { have_db_column(:version).of_type(:string) }
    end

     describe "indexes" do

      must { have_db_index(:slug).unique(true) }
      must { have_db_index([:showcaseable_id, :showcaseable_type]) }
    end
  end

  describe "associations" do 

    must { have_many(:carousels) }
    must { accept_nested_attributes_for(:images) }
    must { belong_to(:showcaseable) }
    must { have_many(:showcases_wines) }
    must { have_many(:wines).through(:showcases_wines) }
  end
  
  Given(:showcase) { build(:showcase) }

  describe "showcase methods" do

    Given(:showcase) { create(:showcase) }
    Given(:wine) { create(:wine) }

    describe "showcase!" do 

      Given { showcase.showcase!(wine.id) }
      Then { showcase.wines.must_include wine }
      And { showcase.showcasing?(wine)}
    
    end

    Given { create(:showcases_wine, wine_id: wine.id, showcase_id: showcase.id) }

    describe "unshowcase!" do 

      Given { showcase.unshowcase!(wine.id) }
      Then { showcase.wines.wont_include wine }
    end

    describe "must return a list of wines" do
      
      # Then { showcase_with_wines.wines.size == 5 }
    end

   
       

    describe "on wine model" do
    end
  end
end
