require 'test_helper'

class ProducerTest < ActiveSupport::TestCase 

  subject { Producer.new }

  describe "columns and types" do 
    
    it { must have_db_column(:name).of_type(:string) }
  end

  describe "indexes" do

    it { must have_db_index(:name) }
  end

  describe "validations" do

    it { must validate_presence_of(:name) }
  end

  describe "associations" do

    it { must have_many(:wineries) }
    it { must have_many(:images) }
    it { must have_many(:addresses) }
    it { must have_many(:vineyards) }
    it { must have_many(:certifications).through(:certifications_producers) }
    
    it { must accept_nested_attributes_for(:wineries) }
    it { must accept_nested_attributes_for(:vineyards) }
    it { must accept_nested_attributes_for(:images) }
  end
end