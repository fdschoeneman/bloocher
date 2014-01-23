require 'test_helper'

describe Role do 

  subject { Role.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:resource_id).of_type(:integer) }
      must { have_db_column(:resource_type).of_type(:string) }
    end
  end
end
