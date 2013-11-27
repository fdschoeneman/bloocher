require "test_helper"

describe AddressesAddressable do

  subject { AddressesAddressable.new }

  describe "db" do 

    describe "columns and types" do 

  		must { have_db_column(:address_id).of_type(:integer) }
  		must { have_db_column(:addressable_id).of_type(:integer) }
  		must { have_db_column(:addressable_type).of_type(:string) }
  	end
  end

  describe "associations" do 

    must { belong_to(:addressable) }
    must { belong_to(:address) }
  end
end
