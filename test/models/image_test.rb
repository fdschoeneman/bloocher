require "test_helper"

describe Image do 

  subject { Image.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:active).of_type(:boolean) }
      must { have_db_column(:content_type).of_type(:string) }
      must { have_db_column(:description).of_type(:text) }
      must { have_db_column(:imageable_id).of_type(:integer) }
      must { have_db_column(:imageable_type).of_type(:string) }
      must { have_db_column(:slug).of_type(:string) }
      must { have_db_column(:title).of_type(:string) }
      must { have_db_column(:user_id).of_type(:integer) }
    end

    describe "indexes" do 

      must { have_db_index([:imageable_id, :imageable_type]) }
      must { have_db_index(:user_id) }
    end
  end

  describe "associations" do

    must { belong_to(:artist) }
    must { have_many(:carousels) }
    must { have_many(:carousels_images) }
    must { belong_to(:imageable) }
    must { belong_to(:producer) }
    must { belong_to(:vineyard) }
    must { belong_to(:winery) }
    must { belong_to(:showcase) }
    must { belong_to(:user) }
  end 

  describe "validations" do 

    must { validate_presence_of(:imageable_id) }
    must { validate_presence_of(:imageable_type) }
    must { validate_presence_of(:user) }
  end
end
