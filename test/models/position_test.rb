require 'test_helper'

describe Position do 

  subject { Position.new }

  describe "db" do 

    describe "columns and types" do 

      it { must have_db_column(:user_id).of_type(:integer)}
      it { must have_db_column(:positionable_id).of_type(:integer)}
      it { must have_db_column(:positionable_type).of_type(:string)}
      it { must have_db_column(:title).of_type(:string)}
    end

    describe "indexes" do

      it { must have_db_index([:title, :user_id])}
    end
  end

  describe "associations" do 

    it { must belong_to(:user) }
    it { must belong_to(:positionable) }
  end
end
