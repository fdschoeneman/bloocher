require "test_helper"

describe Artist do

	subject { Artist.new }

  describe "db" do 

    describe "columns and types" do 
  
      must { have_db_column(:artist_id).of_type(:integer) }
      must { have_db_column(:slug).of_type(:string) }
      must { have_db_column(:statement).of_type(:string) }
    end

     describe "indexes" do

      must { have_db_index(:slug) }
      must { have_db_index(:name) }
    end
  end

  describe "associations" do 

    must { belong_to(:artist) }
    must { have_many(:images) }
    must { have_many(:carousels) }
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
