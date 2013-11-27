require "test_helper"

describe Carousel do 

  subject { Carousel.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:carousable_type).of_type(:string) }
      must { have_db_column(:carousable_id).of_type(:integer) }
      must { have_db_column(:image_id).of_type(:integer) }
    end

    describe "indexes" do 

      must { have_db_index([:carousable_id, :carousable_type]) }
      must { have_db_index(:image_id) }
    end
  end

  describe "associations" do 

    must { belong_to(:image) }
    must { belong_to(:carousable) }
  end
end
