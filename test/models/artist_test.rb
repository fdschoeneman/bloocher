require "test_helper"

describe Artist do

	subject { Artist.new }

  describe "db" do 

    describe "columns and types" do 
  
      it { must have_db_column(:artist_id).of_type(:integer) }
      it { must have_db_column(:slug).of_type(:string) }
      it { must have_db_column(:statement).of_type(:string) }
    end

     describe "indexes" do

      it { must have_db_index(:slug) }
      it { must have_db_index(:name) }
    end
  end

  describe "associations" do 

    it { must belong_to(:artist) }

  end
# oeuvre
# gallery
# carousel

# belongs_to account
	
  # before do
  #   @artist = Artist.new
  # end

  # it "must be valid" do
  #   @artist.valid?.must_equal true
  # end
end
