require "test_helper"

describe Image do 

  subject { Image.new }

  describe "db" do 

    describe "columns and types" do 

      it { must have_db_column(:title).of_type(:string) }
      it { must have_db_column(:description).of_type(:text) }
      it { must have_db_column(:content_type).of_type(:string) }
      it { must have_db_column(:imageable_id).of_type(:integer) }
      it { must have_db_column(:imageable_type).of_type(:string) }
      it { must have_db_column(:active).of_type(:boolean) }
      it { must have_db_column(:slug).of_type(:string) }
      it { must have_db_column(:user_id).of_type(:integer) }
    end

    describe "indexes" do 

      it {must have_db_index([:imageable_id, :imageable_type]) }
      it {must have_db_index(:user_id) }
    end
  end

  describe "associations" do

    it { must belong_to(:user) }
    it { must belong_to(:winery) }
    it { must belong_to(:vineyard) }
    it { must belong_to(:artist) }
    it { must belong_to(:producer) }
    it { must belong_to(:showcase) }
  end 

  describe "validations" do 

    it { must validate_presence_of(:user) }
  end
end
