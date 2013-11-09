# require 'test_helper'

# describe "page titles" do 

#   @controllers = Array.new
  
#   Dir["app/controllers/*.rb"].each do |file|
#     @controllers.push(file.split('/').last.sub!(".rb","").camelize)

#     @controllers.each do |controller|

#       describe eval(controller) do
#         eval(controller).action_methods.to_a.each do |action|

#           it "assigns a page title to #{action}" do
#             unless [:update,:destroy, :after_signup_path_for].include? action.to_sym
#               get action.to_sym
#               assert_not_nil assigns(:page_title)
#             end
#             # true unless ["store_layout"].include? action
#             # []
#         #   file = Dir[File.expand_path("lib/tasks/db/development/objects/" + table + ".rake")].first.to_s
#         #   File.exists?(file).must_equal true unless ["schema_migrations","authentications"].include? table
#           # File.exists?(file).must_equal true unless ["schema_migrations","authentications"].include? table
#             end
#         end
#       end 
#     end    
#   end
# end
# # ApplicationController.descendants
# # Rails.application.eager_load!
# # PostsController.action_methods
# # CustomController.instance_methods(false)


# # ApplicationController.subclasses.each do |c|
# #   puts "Controller: #{c}"
# #   puts "Actions: #{c.constantize.action_methods.collect{|a| a.to_s}.join(', ')}"
# # end
#   # @tables = ActiveRecord::Base.connection.tables
#   # @tables.each do |table|

#   #   describe "#{table}" do

#   #     it "exists" do 
#   #       file = Dir[File.expand_path("lib/tasks/db/development/objects/" + table + ".rake")].first.to_s
#   #       File.exists?(file).must_equal true unless ["schema_migrations","authentications"].include? table
#   #     end 
#   #   end
#   # end
# # end