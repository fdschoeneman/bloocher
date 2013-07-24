require 'test_helper'

class ReviewTest < ActiveSupport::TestCase 
  
  subject { Review.new }

  describe "db" do 

    describe "columns and types" do 

      %w[reviewer_id wine_id rating].each do |attribute|
        it { must have_db_column(attribute.to_sym).of_type(:integer) }
      end

      %w[created_at updated_at
        ].each do |column|
        it { must have_db_column(column.to_sym).of_type(:datetime) }
      end

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
  end




end
