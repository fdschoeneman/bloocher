require 'test_helper'

 describe User do 
 
  subject { User.new}

  describe "db" do 

    describe "columns and types" do
      
      must { have_db_column(:name) }
      must { have_db_column(:current_sign_in_ip).of_type(:string) }
      must { have_db_column(:email).of_type(:string) }
      must { have_db_column(:encrypted_password).of_type(:string) }
      must { have_db_column(:invited_by_type).of_type(:string) }
      must { have_db_column(:invited_by_id).of_type(:integer) }
      must { have_db_column(:invitation_limit).of_type(:integer) }
      must { have_db_column(:name).of_type(:string) }
      must { have_db_column(:reset_password_token).of_type(:string) }
    end

    describe "indexes" do

      must { have_db_index(:email) }
      must { have_db_index([:invited_by_id, :invited_by_type]) }
      must { have_db_index(:name) }
    end
  end

  describe "associations" do

    must { have_many(:artists) }
    must { have_many(:authentications) }
    must { have_many(:addresses_addressable) }
    must { have_many(:addresses).through(:addresses_addressable) }
    must { have_many(:certifications_holdable) }
    must { have_many(:certifications).through(:certifications_holdable) }
    must { have_many(:images) }
    must { have_many(:positions) }
    must { have_many(:showcases) }
    must { accept_nested_attributes_for(:images) }
  end
  
  describe "validations" do 

    Given(:existing_user) { create(:user) }
    Given(:hacker) {  User.new(attributes_for(:user, email: existing_user.email)) }
    
    describe "must be the only user with a given email" do

      # Then { hacker.wont_be valid }
    end
  end
end
