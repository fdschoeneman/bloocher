require 'test_helper'

describe "rake task to create" do 

  @tables = ActiveRecord::Base.connection.tables #[1..2]
  @tables.each do |table|

    describe "#{table} exists" do

      it "exists" do 
        file = Dir[File.expand_path("lib/tasks/db/development/objects/" + table + ".rake")].first.to_s
        File.exists?(file).must_equal true unless table == "schema_migrations"
      end
    end
  end
end