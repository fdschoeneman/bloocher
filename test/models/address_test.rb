require 'test_helper'

describe Address do 

  subject { Address.new } 

  describe "db" do 

    describe "columns and types" do 

      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:address_1).of_type(:string) }
      must { have_db_column(:address_2).of_type(:string) }
      must { have_db_column(:city).of_type(:string) }
      must { have_db_column(:state).of_type(:string) }
      must { have_db_column(:zip).of_type(:string) }
      must { have_db_column(:country).of_type(:string) }
      must { have_db_column(:public_phone).of_type(:string) }
      must { have_db_column(:public_email).of_type(:string) }
      must { have_db_column(:public_url).of_type(:string) }
      must { have_db_column(:addressable_type).of_type(:string) }
      must { have_db_column(:addressable_id).of_type(:integer) }
    end

    describe "indexes" do 

      must { have_db_index([:addressable_id, :addressable_type]) }

    end
  end

  describe "associations" do 

    must { have_many(:addresses_addressables) }
    must { have_many(:artists).through(:addresses_addressables) }
    must { have_many(:producers).through(:addresses_addressables) }
    must { have_many(:vineyards).through(:addresses_addressables) }
    must { have_many(:wineries).through(:addresses_addressables) }
    must { have_many(:users).through(:addresses_addressables) }
  end
end
