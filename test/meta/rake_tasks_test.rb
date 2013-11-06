require 'test_helper'

describe "rake:db:development:create" do 

  @tables = ActiveRecord::Base.connection.tables
  @tables.each do |table|

    describe "#{table}" do

      it "exists" do 
        file = Dir[File.expand_path("lib/tasks/db/development/objects/" + table + ".rake")].first.to_s
        File.exists?(file).must_equal true unless ["schema_migrations","authentications"].include? table
      end 
    end
  end
end