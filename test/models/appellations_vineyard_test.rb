require 'test_helper'

describe AppellationsVineyard do 

  subject { AppellationsVineyard.new }

  describe "db" do 

    describe "columns and types" do 

  		must { have_db_column(:vineyard_id).of_type(:integer) }
  		must { have_db_column(:appellation_id).of_type(:integer) }
  	end

  	describe "indexes" do 

  		must { have_db_index([:vineyard_id, :appellation_id]).unique(true) }
  	end
  end

  describe "associations" do

    must { belong_to(:appellation) } 
    must { belong_to(:vineyard) } 
  end
end
