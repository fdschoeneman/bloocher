require 'test_helper'

class AppellationTest < ActiveSupport::TestCase 

  subject { create(:appellation }

  describe "database" do

    describe "columns" do 

      %w[name type map].each do |column|

        it { must have_db_column(column.to_sym).of_type(:string) }
      end
    end

    describe "indexes" do 

      it { must have_db_index([:name, :type]).unique(true) }
    end
  end

  describe "associations" do

    it { must have_many(:appellations_vineyards) }
  end
end