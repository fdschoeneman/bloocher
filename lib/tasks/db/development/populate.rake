namespace 'db:development' do 

  desc "Populates the development database"
  task populate: [:clear_objects, :create_objects, 'db:test:prepare'] 
end

def satisfy_dependencies(dependencies)
  dependencies.each do |model|

    if model.classify.constantize.count < 5
      puts "#{green("  -->")} satisfying #{model.downcase} dependency"
      Rake::Task["db:development:create:#{model.underscore.pluralize}"].invoke
    end
  end
end

@accounts = 10
@accounts_activations = 20
@accounts_admins = 20
@activations = 5
@accounts_admins = 5
@addresses = 20
@artists = 5
@appellations = 20
@appellations_vineyards = 60
@authentications = 5
@carousels = 2
@certifications = 5 
@certifications_producers = 20
@fruit_lots = 20
@images = 2
@positions = 20
@producers = 5
@reviews = 20
@roles = 3
@showcases = 5 
@showcases_wines = 20
@users = 39
@vineyards = 5
@vineyards_vintages = 20 
@wines = 20
@wines_fruit_lots = 20
@wineries = 5