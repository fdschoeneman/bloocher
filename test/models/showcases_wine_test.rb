require "test_helper"

 describe ShowcasesWine do 
 
  subject { ShowcasesWine.new }

  describe "db" do

    describe "columns and types" do 

      it { must have_db_column(:showcase_id).of_type(:integer)}
      it { must have_db_column(:wine_id).of_type(:integer)}
      it { must have_db_column(:blurb_id).of_type(:integer)}
    end 
  end

  describe "associations" do 

    it { must belong_to(:showcase) }
    it { must belong_to(:wine) }
    it { must belong_to(:blurb).class_name("Review") }
  end
end
