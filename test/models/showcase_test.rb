require "test_helper"

class ShowcaseTest < ActiveSupport::TestCase

  subject { Showcase.new }

  describe "db" do 

    describe "columns and types" do 

      it { must have_db_column(:sommelier_id).of_type(:integer) }
      it { must have_db_column(:title).of_type(:string) }
      it { must have_db_column(:published).of_type(:boolean) }
      it { must have_db_column(:description).of_type(:text) }
      it { must have_db_column(:version).of_type(:string) }
    end
  end

  describe "associations" do 

    it { must belong_to(:sommelier).class_name("User") }
    it { must have_many(:carousels) }
    it { must have_many(:showcases_wines) }
    it { must have_many(:wines).through(:showcases_wines) }
    it { must accept_nested_attributes_for(:images) }
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