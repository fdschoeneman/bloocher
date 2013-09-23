require 'test_helper'

describe Address do 

  subject { Address.new } 

  describe "db" do 

    describe "columns and types" do 

      it { must have_db_column(:address_1).of_type(:string) }
      it { must have_db_column(:address_2).of_type(:string) }
      it { must have_db_column(:city).of_type(:string) }
      it { must have_db_column(:state).of_type(:string) }
      it { must have_db_column(:zip).of_type(:string) }
      it { must have_db_column(:country).of_type(:string) }
      it { must have_db_column(:public_phone).of_type(:string) }
      it { must have_db_column(:public_email).of_type(:string) }
      it { must have_db_column(:public_url).of_type(:string) }
      it { must have_db_column(:addressable_type).of_type(:string) }
      it { must have_db_column(:addressable_id).of_type(:integer) }
    end

    describe "indexes" do 

    end
  end

  describe "associations" do 

    it { must belong_to(:addressable) } 
  end
end
