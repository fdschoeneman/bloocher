Dir[Rails.root.join("lib/sample_data/*.rb")].each {|f| require f}
Dir[Rails.root.join("lib/tasks/support/*.rb")].each {|f| require f}

include RakeColorizer 
include RakePrettifier

desc "alias for db:development:populate"
task populate: ['db:development:populate', :environment] 

@accounts = 10
@accounts_activations = 20
@accounts_admins = 20
@activations = 5
@accounts_admins = 5
@addresses = 20
@appellations = 20
@appellations_vineyards = 60
@artists = 5
@authentications = 5
@carousels = 5
@certifications = 5 
@certifications_producers = 20
@fruit_lots = 20
@images = 20
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