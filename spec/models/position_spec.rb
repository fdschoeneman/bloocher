require 'spec_helper'

describe Position do

  describe "database" do 

    it { should have_db_column(:user_id).of_type(:integer)}
    it { should have_db_column(:positionable_id).of_type(:integer)}
    it { should have_db_column(:positionable_type).of_type(:string)}
    it { should have_db_column(:title).of_type(:string)}
  end

  describe "indexes" do

    it { should have_db_index([:title, :user_id])}
  end

  describe "associations" do 

    it { should belong_to(:user) }
    it { should belong_to(:positionable) }
  end

end
