require 'spec_helper'

describe Review do
  
  describe "columns" do 

    %w[reviewer_id wine_id rating].each do |attribute|
      it { should have_db_column(attribute.to_sym).of_type(:integer) }
    end

    it { should have_db_column(:content).of_type(:text) }
  end

  describe "indexes" do 
    it { should have_db_index(:rating) }
    it { should have_db_index(:reviewer_id) }
    it { should have_db_index(:wine_id) }
  end

    describe "mass assignable" do 
      %w[content rating
      ].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe "protected" do 

      %w[created_at updated_at
      ].each do |attribute|
        it {should_not allow_mass_assignment_of(attribute.to_sym) }
      end
    end
end
