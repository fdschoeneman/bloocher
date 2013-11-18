require 'test_helper'

describe Certification do 

  subject { Certification.new }

  describe "db" do 

    describe "columns and types" do 

  		it { must have_db_column(:name).of_type(:string) }
  		it { must have_db_column(:url).of_type(:string) }
  		it { must have_db_column(:description).of_type(:text) }
  	end
  end

  describe "associations" do 

    it { must have_many(:certifications_holdables) }
    it { must have_many(:wines).through(:certifications_holdables) }
    it { must have_many(:producers).through(:certifications_holdables) }
    it { must have_many(:wineries).through(:certifications_holdables) }
    it { must have_many(:vineyards).through(:certifications_holdables) }
  end
end
