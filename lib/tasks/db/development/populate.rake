namespace 'db:development' do 

  @accounts_activations = 20
  @accounts_admins = 20
  @activations = 5
  @accounts_admins = 5
  @artists = 5
  @authentications = 3
  @certifications_producers = 20
  @fruit_lots_wines = 20
  @reviews = 20
  @roles = 3
  @users = 10
  @vineyards = 20
  @blocks
  @wines = 20
  @wines_fruit_lots = 20
  @wineries = 5

  desc "Populates the development database"

  task populate: [:clear_objects, :create_objects, :verify_object_counts] 

  desc "Verifies object counts set in populate"

  task verify_object_counts: :environment do 


    Rake.application.in_namespace('db:development:create') do |x|

      x.tasks.each do |task|

        database_table = task.name.split(":").last.classify
        objects_in_db = task.name.split(":").last.classify.constantize.count
        count = "@#{task.name.split(":").last}"
        @objects = eval(count)
        
        unless @objects.nil?
          if objects_in_db == @objects
            puts green("#{count} count of (#{@objects.to_i}) matches objects in db")
          else
            puts yellow("#{count} count of (#{@objects.to_i}) does not match objects in db (#{objects_in_db})")
          end
        end
        if @objects.nil?
          if objects_in_db > 0
            puts green("#{database_table} table has (#{objects_in_db}) objects")
          else
            puts red("#{database_table} table has no objects")
          end
        end
      end
    end
  end
end

def satisfy_dependencies(dependencies)

  dependencies.each do |model|
    desired_count = eval("@" + model.pluralize) 
    actual_count = model.classify.constantize.count
    unless desired_count.nil? || actual_count >= desired_count
      puts "#{green("  -->")} satisfying #{model.downcase} dependency"
      Rake::Task["db:development:create:#{model.underscore.pluralize}"].invoke
    end
  end
end
