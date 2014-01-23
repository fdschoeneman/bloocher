require 'test_helper'

 describe Review do 
 
  subject { Review.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:rating).of_type(:integer) }
      must { have_db_column(:reviewer_id).of_type(:integer) }
      must { have_db_column(:wine_id).of_type(:integer) }
      must { have_db_column(:content).of_type(:text) }
    end
  end

  describe "indexes" do 

    must { have_db_index(:rating) }
    must { have_db_index(:reviewer_id) }
    must { have_db_index(:wine_id) }
  end

  describe "validations" do 

    must { validate_presence_of(:content) }
    must { ensure_length_of(:content).is_at_least(6) }
    must { validate_presence_of(:reviewer_id) }
    must { validate_presence_of(:wine_id) }
    must { validate_numericality_of(:wine_id) }
  end

  describe "associations" do 

    must { belong_to(:wine) }
    must { belong_to(:reviewer).class_name("User") }
    must { have_many(:showcases_wines) }
  end
end
