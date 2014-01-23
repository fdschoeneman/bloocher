require 'test_helper'

describe Position do 

  subject { Position.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:user_id).of_type(:integer) }
      must { have_db_column(:positionable_id).of_type(:integer) }
      must { have_db_column(:positionable_type).of_type(:string) }
      must { have_db_column(:title).of_type(:string) }
    end

    describe "indexes" do

      must { have_db_index([:title, :user_id]) }
      must { have_db_index([:positionable_id, :positionable_type]) }
    end
  end

  describe "associations" do 

    must { belong_to(:user) }
    must { belong_to(:positionable) }
  end
end
