require 'test_helper'

describe Producer do 

  subject { Producer.new }

  describe "columns and types" do 
    
    it { must have_db_column(:name).of_type(:string) }
    it { must have_db_column(:slug).of_type(:string) }
  end

  describe "indexes" do

    it { must have_db_index(:name) }
    it { must have_db_index(:slug) }
  end

  describe "validations" do

    it { must validate_presence_of(:name) }
  end

  describe "associations" do

    it { must have_many(:accounts) }
    it { must have_many(:addresses_addressable) }
    it { must have_many(:addresses).through(:addresses_addressable) }
    it { must have_many(:carousels) }
    it { must have_many(:certifications_holdable) }
    it { must have_many(:certifications).through(:certifications_holdable) }
    it { must have_many(:images) }
    it { must have_many(:positions) }
    it { must have_many(:showcases) }
    it { must have_many(:vineyards) }
    it { must have_many(:wineries) }
    it { must have_many(:wines).through(:wineries) }
    
    it { must accept_nested_attributes_for(:wineries) }
    it { must accept_nested_attributes_for(:vineyards) }
    it { must accept_nested_attributes_for(:images) }
  end
end
