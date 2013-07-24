require 'test_helper'

class AppellationsVineyardTest < ActiveSupport::TestCase

  subject { AppellationsVineyard.new }

  describe "db" do 

    describe "columns and types" do 

  		it { must have_db_column(:vineyard_id).of_type(:integer) }
  		it { must have_db_column(:appellation_id).of_type(:integer) }
  	end

  	describe "indexes" do 

  		it { must have_db_index([:vineyard_id, :appellation_id]).unique(true) }
  	end
  end

  describe "associations" do

    it { must belong_to(:appellation) } 
    it { must belong_to(:vineyard) } 
  end
end
