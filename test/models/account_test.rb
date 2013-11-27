require "test_helper"

describe Account do

	subject { Account.new }

	describe "db" do

		describe "columns and types" do 

			must { have_db_column(:accountable_id).of_type(:integer) }
			must { have_db_column(:accountable_type).of_type(:string) }
			must { have_db_column(:activation_id).of_type(:integer) }
			must { have_db_column(:subdomain).of_type(:string) }
		end

		describe "indexes" do 

			must { have_db_index([:accountable_id, :accountable_type]).unique(true) }
			must { have_db_index(:activation_id) }
			must { have_db_index(:subdomain).unique(true) }
		end
	end

	describe "associations" do 

		must { belong_to(:accountable) }
		must { have_many(:activations) }
	end

	describe "validations" do 

		must { validate_uniqueness_of(:subdomain) }
		must { validate_presence_of(:subdomain) }
		must { ensure_length_of(:subdomain).is_at_least(4).is_at_most(40) }
		
		describe "on subdomain" do 

			["subdomain", "subdomain-with-dashes", "su830ma1n-w174-num3rs", 
        "3u8d0ma1n-s7ar71ng-with-num3rs", "fredshoeneman"
      ].each do |valid_subdomain|
      	
      	it "should accept valid subdomains like #{valid_subdomain}" do
          must allow_value(valid_subdomain).for(:subdomain) 
        end
      end

      ["under_score", "sub domain with spaces", "subdomain_with_non_ascii%$#", "sub_do_main",
        "-subdomain", "subdomain-"
        ].each do |bad_subdomain|
          it "should not accept #{bad_subdomain}" do 
          wont allow_value(bad_subdomain).for(:subdomain)
        end
      end
              
      it "should not allow reserved subdomains" do 
        %w[ support blog www billing help api merciboku privacy help legal terms blog
        ].each do |reserved_subdomain|
          wont allow_value(reserved_subdomain).for(:subdomain)#.with_message(/reserved and unavailable/) 
        end
      end
    end
	end

	describe "methods" do 

	end
end
