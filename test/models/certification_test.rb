require 'test_helper'

describe Certification do 

  subject { Certification.new }

  describe "db" do 

    describe "columns and types" do 

  		must { have_db_column(:certifying_body_id).of_type(:integer) }
      must { have_db_column(:description).of_type(:text) }
  		must { have_db_column(:certification_type).of_type(:string) }
  	end
  end

  describe "associations" do 

    must { have_many(:certifications_holdables) }
    must { have_many(:wines).through(:certifications_holdables) }
    must { have_many(:producers).through(:certifications_holdables) }
    must { have_many(:wineries).through(:certifications_holdables) }
    must { have_many(:vineyards).through(:certifications_holdables) }
  end
end
