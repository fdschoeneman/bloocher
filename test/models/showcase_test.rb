require "test_helper"

class ShowcaseTest < ActiveSupport::TestCase

  subject { Showcase.new }

  describe "db" do 

    describe "columns and types" do 

      it { must have_db_column(:showcaseable_type).of_type(:string) }
      it { must have_db_column(:name).of_type(:string) }
      it { must have_db_column(:showcaseable_id).of_type(:integer) }
      it { must have_db_column(:published).of_type(:boolean) }
      it { must have_db_column(:description).of_type(:text) }
      it { must have_db_column(:version).of_type(:datetime) }
    end
  end
end