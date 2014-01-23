require "test_helper"

describe CarouselsImage do

  subject { CarouselsImage.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:carousel_id).of_type(:integer) }
      must { have_db_column(:image_id).of_type(:integer) }
    end

    describe "indexes" do

      must { have_db_index([:carousel_id, :image_id]).unique(true) }
      must { have_db_index(:carousel_id) }
      must { have_db_index(:image_id) }
    end
  end

  describe "associations" do 
    must { belong_to(:carousel) }
    must { belong_to(:image) }
  end
end