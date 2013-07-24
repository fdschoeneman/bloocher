require 'test_helper'

class ProducerTest < ActiveSupport::TestCase 

  subject { Producer.new }

  describe "columns and types" do 
    
    it { must have_db_column(:address_1).of_type(:string) }
    it { must have_db_column(:address_1).of_type(:string) }
    
    %w[created_at updated_at].each do |column|
      it { must have_db_column(column.to_sym).of_type(:datetime) }
    end
  end

  describe "indexes" do

    %w[name subdomain city state].each do |column|
      it { must have_db_index(column.to_sym) }
    end
  end

  describe "validations" do

    %w[].each do |attribute|
      it { must validate_presence_of(attribute.to_sym) }
    end
  end

  describe "associations" do

    it { must have_many(:owners).through(:ownerships).class_name("User") }
    it { must have_many(:wineries) }
    it { must have_many(:vineyards) }
    it { must have_many(:certifications_producers) }
    it { must have_many(:certifications).through(:certifications_producers) }
    it { must accept_nested_attributes_for(:wineries) }
  end
end