require 'test_helper'

class RoleTest < ActiveSupport::TestCase 

  subject { Role.new }

  describe "db" do 

    describe "columns and types" do 

      it { must have_db_column(:name).of_type(:string) }
      it { must have_db_column(:resource_id).of_type(:integer) }
      it { must have_db_column(:resource_type).of_type(:string) }
    end
  end
end