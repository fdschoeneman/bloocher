require "test_helper"

describe Activation do

  subject { Activation.new }

  describe "db" do 

  	describe "columns and types" do 

  		it { must have_db_column(:credit_card) }
  	end
  end

  describe "associations" do 

  	it { must have_many(:accounts_activations) }
  	it { must have_many(:accounts).through(:accounts_activations) }
  end
end
