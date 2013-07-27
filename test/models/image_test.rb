require "test_helper"

class ImageTest < ActiveSupport::TestCase

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
    end
  end
end