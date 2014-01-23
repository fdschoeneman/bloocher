# namespace :db do 
#   namespace :test do 
#     task :reset do 

#       puts "#{green("==>")} connecting to test db"
#       ActiveRecord::Base.establish_connection('test')

#       puts "#{green("==>")} dropping test db"
#       Rake::Task['db:drop'].invoke

#       puts "#{green("==>")} creating test db"
#       Rake::Task['db:create'].invoke

#       puts "#{green("==>")} loading schema to test db"
#       Rake::Task['db:test:prepare'].invoke

#       # Make sure you don't have side-effects!
#       puts "#{green("==>")} establishing connection to development db"
#       ActiveRecord::Base.establish_connection(ENV['RAILS_ENV']) 

#     end
#   end
# end