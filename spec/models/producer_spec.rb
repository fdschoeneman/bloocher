require 'spec_helper'

describe Producer do
   describe "columns" do
    
    %w[address_1 address_2 city state name subdomain web_address public_email 
      phone zip].each do |column|
      it { should have_db_column(column.to_sym).of_type(:string) }
    end
    
    %w[created_at updated_at].each do |column|
      it { should have_db_column(column.to_sym).of_type(:datetime) }
    end
  end

  describe "indexes" do

    %w[name subdomain city state].each do |column|
      it { should have_db_index(column.to_sym) }
    end
  end

  describe 'security' do 

    describe 'mass assignable' do 

      %w[address_1 address_2 city name public_email state subdomain 
        web_address zip].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe 'protected' do 

      %w[created_at updated_at producer_id].each do |attribute|
        it {should_not allow_mass_assignment_of(attribute.to_sym) }
      end
    end
  end

  describe "validations" do

    %w[].each do |attribute|
      it { should validate_presence_of(attribute.to_sym) }
    end
  end

  describe "associations" do


    it { should have_many(:ownerships).dependent(:destroy) }
    it { should have_many(:owners).through(:ownerships).class_name("User") }
    it { should have_many(:wineries) }
    it { should have_many(:vineyards) }
    it { should have_many(:certifications_producers) }
    it { should have_many(:certifications).through(:certifications_producers) }
    it { should accept_nested_attributes_for(:wineries) }
  end
end