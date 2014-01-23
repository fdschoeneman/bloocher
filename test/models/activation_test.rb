require "test_helper"

describe Activation do

  subject { Activation.new }

  describe "db" do 

  	describe "columns and types" do 

  		must { have_db_column(:activator_id).of_type(:integer) }
  	end
  end

  describe "associations" do 

    must { belong_to(:activator).class_name("User") }
  	must { have_many(:accounts_activations) }
  	must { have_many(:accounts).through(:accounts_activations) }
  end
end
