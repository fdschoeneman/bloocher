require 'test_helper'

class UserTest < ActiveSupport::TestCase 
  
  subject { User.new }

  describe "db" do 

    describe "columns and types" do
      
      it { must have_db_column(:email).of_type(:string) }
      it { must have_db_column(:encrypted_password).of_type(:string) }
      it { must have_db_column(:reset_password_token).of_type(:string) }
      it { must have_db_column(:current_sign_in_ip).of_type(:string) }
      it { must have_db_column(:name).of_type(:string) }
      it { must have_db_column(:invited_by_type).of_type(:string) }
      it { must have_db_column(:invitation_limit).of_type(:integer) }
      it { must have_db_column(:invited_by_id).of_type(:integer) }
    end

    describe "indexes" do

      it { must have_db_index(:email) }
      it { must have_db_index(:name) }
    end
  end

  describe "associations" do

    it { must have_many(:images) }
    it { must have_many(:addresses) }
    it { must have_many(:positions) }
    it { must have_many(:showcases) }
    it { must accept_nested_attributes_for(:images) }
  end
  
  describe "validations" do 

    Given(:existing_user) { create(:user) }
    Given(:hacker) {  User.new(attributes_for(:user, email: existing_user.email)) }
    
    describe "must be the only user with a given email" do

      # Then { hacker.wont_be valid }
    end
  end
end
