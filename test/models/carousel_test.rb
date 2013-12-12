require "test_helper"

describe Carousel do 

  subject { Carousel.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:carousable_type).of_type(:string) }
      must { have_db_column(:carousable_id).of_type(:integer) }
      must { have_db_column(:name).of_type(:string) }
    end

    describe "indexes" do 

      must { have_db_index([:carousable_id, :carousable_type]) }
    end
  end

  describe "associations" do 

    must { have_many(:images) }
    must { have_many(:images).through(:carousels_images) }
    must { have_many(:carousels_images) }
    must { belong_to(:carousable) }
  end
end
