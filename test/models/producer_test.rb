require 'test_helper'

describe Producer do 

  subject { Producer.new }

  describe "columns and types" do 
    
    must { have_db_column(:name).of_type(:string) }
    must { have_db_column(:slug).of_type(:string) }
  end

  describe "indexes" do

    must { have_db_index(:name) }
    must { have_db_index(:slug) }
  end

  describe "validations" do

    must { validate_presence_of(:name) }
    must { validate_uniqueness_of(:name) }
  end

  describe "associations" do

    must { have_many(:accounts) }
    must { have_many(:addresses_addressable) }
    must { have_many(:addresses).through(:addresses_addressable) }
    must { have_many(:carousels) }
    must { have_many(:certifications_holdable) }
    must { have_many(:certifications).through(:certifications_holdable) }
    must { have_many(:images) }
    must { have_many(:positions) }
    must { have_many(:showcases) }
    must { have_many(:vineyards) }
    must { have_many(:wineries) }
    must { have_many(:wines).through(:wineries) }
    
    must { accept_nested_attributes_for(:wineries) }
    must { accept_nested_attributes_for(:vineyards) }
    must { accept_nested_attributes_for(:images) }
  end
end
