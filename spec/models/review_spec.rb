require 'spec_helper'

describe Review do
  
  describe "columns" do 

    %w[reviewer_id wine_id rating].each do |attribute|
      it { should have_db_column(attribute.to_sym).of_type(:integer) }
    end

    %w[created_at updated_at
      ].each do |column|
      it { should have_db_column(column.to_sym).of_type(:datetime) }
    end

    it { should have_db_column(:content).of_type(:text) }
  end

  describe "indexes" do 
    it { should have_db_index(:rating) }
    it { should have_db_index(:reviewer_id) }
    it { should have_db_index(:wine_id) }
  end

  describe "security" do 

    describe "mass assignable" do 
      %w[content rating reviewer_id wine_id 
      ].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe "protected" do 

      %w[review_id created_at updated_at
      ].each do |attribute|
        it {should_not allow_mass_assignment_of(attribute.to_sym) }
      end
    end
  end

  describe "validations" do 

    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:reviewer_id) }
    it { should validate_presence_of(:wine_id) }
  end

  describe "associations" do 

    it { should belong_to(:wine) }
    it { should belong_to(:reviewer).class_name("User") }
  end




end
