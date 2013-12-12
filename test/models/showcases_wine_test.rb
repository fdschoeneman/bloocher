require "test_helper"

 describe ShowcasesWine do 
 
  subject { ShowcasesWine.new }

  describe "db" do

    describe "columns and types" do 

      must { have_db_column(:showcase_id).of_type(:integer)}
      must { have_db_column(:wine_id).of_type(:integer)}
      must { have_db_column(:blurb_id).of_type(:integer)}
    end 

    describe "indexes" do

      must { have_db_index(:showcase_id) }
      must { have_db_index(:wine_id) }
      must { have_db_index(:blurb_id) }
    end
  end

  describe "associations" do 

    must { belong_to(:showcase) }
    must { belong_to(:wine) }
    must { belong_to(:blurb).class_name("Review") }
  end
end
