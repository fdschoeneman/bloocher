require "test_helper"

describe CertifyingBody do

  subject { CertifyingBody.new }

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:mission).of_type(:string) }
      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:url).of_type(:string) }
    end


    describe "associations" do 

      must { have_many(:accounts) }
      must { have_many(:addresses_addressable) }
      must { have_many(:addresses).through(:addresses_addressable) }
      must { have_many(:certifications) }
    end
  end
end