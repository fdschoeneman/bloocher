require 'spec_helper'

describe WinemakerOeuvre do

  describe "database" do 

    describe "columns" do 

      it { should have_db_column(:wine_id).of_type(:integer) }
      it { should have_db_column(:winemaker_id).of_type(:integer) }
    end

    describe "indexes" do 

      it { should have_db_index(:wine_id) }
    end
  end

  describe "security" do 

    describe "mass assignable" do 

      it { should allow_mass_assignment_of(:wine_id) }
      it { should allow_mass_assignment_of(:winemaker_id) }
    end

    describe "protected" do 

      it { should_not allow_mass_assignment_of(:winemaker_oeuvre_id) }
    end
  end

  describe "validations" do 

    it { should validate_presence_of(:wine_id) }
    it { should validate_presence_of(:winemaker_id) }
  end

  describe "associations" do 

    it { should belong_to(:wine) }
    it { should belong_to(:winemaker).class_name("User")}
  end

  describe "methods" do

    it { should respond_to(:winemaker) }
    it { should respond_to(:wine) }
  end

end
