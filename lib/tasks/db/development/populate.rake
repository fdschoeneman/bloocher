namespace :db do 

	desc "alias for db:development:populate"
	task populate: ['development:populate', :environment]

	namespace :development do 

	  desc "Populates the development database"
	  task populate: [:clear_objects, :create_objects] 

	end
end
