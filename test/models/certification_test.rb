require 'test_helper'

class CertificationTest < ActiveSupport::TestCase 

  subject { Certification.new }

  describe "db" do 

    describe "columns and types" do 

  		it { must have_db_column(:name).of_type(:string) }
  		it { must have_db_column(:url).of_type(:string) }
  		it { must have_db_column(:description).of_type(:text) }
  	end
  end
end
