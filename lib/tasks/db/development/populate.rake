namespace 'db:development' do 

  @accounts = 5
  @accounts_activations = 20
  @accounts_admins = 20
  @activations = 5
  @accounts_admins = 5
  @addresses = 20
  @addresses_addressables = 1
  @artists = 5
  @appellations = 20
  @appellations_vineyards = 10
  @authentications = 5
  @carousels = 2
  @carousels_images = 2
  @certifications = 5 
  @certifications_holdables = 20
  @certifications_producers = 20
  @fruit_lots = 20
  @fruit_lots_wines = 20
  @images = 2
  @positions = 20
  @producers = 5
  @reviews = 20
  @roles = 3
  @showcases = 5 
  @showcases_wines = 2
  @users = 10
  @vineyards = 5
  @vineyards_vintages = 20 
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

        objects_in_db = task.name.split(":").last.classify.constantize.count
        count = "@#{task.name.split(":").last}"
        @objects = eval(count)
        
        if objects_in_db == @objects
          puts green("#{count} count of (#{@objects.to_i}) matches objects in db")
        else
          puts cyan("#{count} count of (#{@objects.to_i}) does not match objects in db (#{objects_in_db})")
        end
      end
    end
  end
end

def satisfy_dependencies(dependencies)
  dependencies.each do |model|

    if model.classify.constantize.count < eval("@" + model.pluralize)
      puts "#{green("  -->")} satisfying #{model.downcase} dependency"
      Rake::Task["db:development:create:#{model.underscore.pluralize}"].invoke
    end
  end
end
