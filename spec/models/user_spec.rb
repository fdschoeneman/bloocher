require 'spec_helper'

describe User do

  describe 'database' do 

    describe 'columns' do 

      %w[reset_password_sent_at remember_created_at current_sign_in_at 
        last_sign_in_at confirmed_at confirmation_sent_at 
        created_at updated_at
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:datetime) }
      end
      
      %w[email encrypted_password 
        reset_password_token current_sign_in_ip last_sign_in_ip
        confirmation_token unconfirmed_email name phone address_1
        address_2 city state zip website  
        ].each do |column|
        it { should have_db_column(column.to_sym).of_type(:string) }
      end

      it { should have_db_column(:sign_in_count).of_type(:integer) }
      
      it { should have_db_column(:bio).of_type(:text) }
    end

    describe 'indexes' do 

      %w[confirmation_token email reset_password_token
      ].each do |index|
        it { should have_db_index(index.to_sym).unique(true)}
      end
    end
  end

  describe "security" do

    describe "mass assignable" do 

      %w[name email password password_confirmation
        remember_me bio phone address_1 address_2 city state zip phone website
      ].each do |attribute|
        it {should allow_mass_assignment_of(attribute.to_sym) }
      end
    end

    describe "protected" do 

      %w[user_id admin encrypted_password reset_password_token 
        reset_password_sent_at remember_created_at unconfirmed_email 
        sign_in_count current_sign_in_at last_sign_in_at
        confirmation_token confirmed_at confirmation_sent_at 
        unconfirmed_email
      ].each do |attribute|
        it { should_not allow_mass_assignment_of(attribute.to_sym) }
      end
    end
  end

  describe "validations" do

    before(:each) { FactoryGirl.create(:user) }
    
    describe "email" do 

      it { should validate_presence_of(:email)
        .with_message(/can't be blank/) }
      it { should validate_uniqueness_of(:email)
        .with_message(/already been taken/) }
    
      it "should allow properly formed emails" do 
        ["fred@test.com", "pat@gmail.com", "user.period@yahoo.com", 
          "user_underscore@msn.hotmail.com"
        ].each do |good_email|
          should allow_value(good_email).for(:email) 
        end
      end

      it "should disallow bad emails" do 
        ["fre_d@.com", "@gmail.com", "hotmail.com", "gmail"].each do |bad_email|
          should_not allow_value(bad_email).for(:email) 
        end
      end
    end

    describe "password" do 

      it "should be more than 5 and less than 41 characters long" do 
        should_not allow_value("a" * 41).for(:password) 
        should_not allow_value("a" * 5).for(:password) 
        should allow_value("a" * 40).for(:password) 
        should allow_value("a" * 6).for(:password) 
      end
    end
  end

  describe "associations" do

    it { should have_many(:winemaker_oeuvres) }
    it { should have_many(:reviews) }
    it { should have_many(:wines_made).through(:winemaker_oeuvres) }

    describe "with producer model" do

      it { should have_many(:ownerships).dependent(:destroy) }
      it { should have_many(:producers).through(:ownerships) }
    end

    it { should respond_to(:wineries_owned) }
  end
  
  describe "methods" do 

    it { should respond_to(:ownerships) }
    it { should respond_to(:producers) }
    it { should respond_to(:wines_made) }
    it { should respond_to(:settings) }
  end
end
