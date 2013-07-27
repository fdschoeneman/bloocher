require 'test_helper'

class ReviewTest < ActiveSupport::TestCase 
  
  subject { Review.new }

  describe "db" do 

    describe "columns and types" do 

      it { must have_db_column(:rating).of_type(:integer) }
      it { must have_db_column(:reviewer_id).of_type(:integer) }
      it { must have_db_column(:wine_id).of_type(:integer) }
      it { must have_db_column(:content).of_type(:text) }
    end
  end

  describe "indexes" do 

    it { must have_db_index(:rating) }
    it { must have_db_index(:reviewer_id) }
    it { must have_db_index(:wine_id) }
  end

  describe "validations" do 

    it { must validate_presence_of(:content) }
    it { must ensure_length_of(:content).is_at_least(6) }
    it { must validate_presence_of(:reviewer_id) }
    it { must validate_presence_of(:wine_id) }
    it { must validate_numericality_of(:wine_id) }
  end

  describe "associations" do 

    it { must belong_to(:wine) }
    it { must belong_to(:reviewer).class_name("User") }
    it { must have_many(:showcases_wines) }
  end
end
