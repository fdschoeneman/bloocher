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
@appellations_vineyards = 20
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
# # def make_vineyard

# #   block_planting_year = rand(1955..2010)
# #   block_grafting_year = block_planting_year + rand(0..3)
# #   @vineyard = Vineyard.new(
# #     topo_aspect: topo_aspects.sample,
# #     topo_slope: rand(1..50)/1000.to_f,
# #     topo_elevation: rand(10..8000),
# #     soil_composition: soil_types.sample,
# #     soil_drainage: soil_drainage_types.sample,
# #     soil_depth: rand(18..40),
# #     soil_fertility: rand(1..40)/1000.to_f,
# #     soil_water_capacity: rand(6..8),
# #     soil_ph: rand(38..80)/10.to_f,
# #     rootstock: rootstock.sample,
# #     varietal: varietals.sample,
# #     clone: clones.sample,
# #     planted_on: rand(1955..2010),
# #     irrigation: irrigation_types.sample,
# #     nursery: nurseries.sample,
# #     planted_on: block_planting_year,
# #     grafted_on: block_grafting_year
# #   )
# # end

# # def make_vineyard_parents

# #   boonville_vineyards.each do |vineyard_name|
# #     make_vineyard
# #     @vineyard.update_attributes(
# #       name: vineyard_name,
# #       producer_id: rand(1..20)
# #     )
# #     @vineyard.save
# #   end
# # end

# # def make_vineyard_blocks

# #   20.times do |block|
# #     make_vineyard
# #     block_name = %w[east west north southeast creekside river hillside 1A 2A].sample
# #     @vineyard.update_attributes(
# #       name: block_name, 
# #       producer_id: rand(1..10),
# #       vineyard_parent_id: rand(1..10)
# #     )
# #     @vineyard.save
# #   end
# # end

# # def make_vineyard_vintages

# #   20.times do |vintage|
# #     day = rand(1..15)
# #     month = [4,5].sample
# #     year = rand(2009..2012)
# #     last_frost = Time.new(year, month, day) 
# #     bud_break = Time.new(year, month, day + 13)
# #     bloom_date = Time.new(year, month + 1, day)
# #     veraison = Time.new(year, month + 2, day)
# #     VineyardVintage.create(
# #       vineyard_id: rand(1..40),
# #       growing_degree_days: rand(1800..2500),
# #       days_above_100: rand(2..20),
# #       last_frost: last_frost,
# #       bud_break: bud_break,
# #       bloom_date: bloom_date,
# #       veraison: veraison,
# #       average_yearly_rel_hum: rand(60..75)/100.to_f
# #     )
# #   end
# # end

# # def make_fruit_lots

# #   20.times do |fruit_lot|
# #     random_day = rand(1..28)
# #     harvest_date = Date.new(2012, 8, random_day)
# #     FruitLot.create(
# #       brix: rand(150..250)/10.to_f,
# #       weight: rand(25..250)/100.to_f,
# #       harvest_date: harvest_date,
# #       vineyard_vintage_id: rand(1..40)
# #     )
# #   end
# # end

# # def make_wine_fruit_lots

# #   20.times do |wine_fruit_lot|
# #     WineFruitLot.create!(
# #       wine_id: rand(1..20),
# #       percent_of_wine: rand(20..100),
# #       fruit_lot_id: rand(1..20)
# #     )
# #   end
# # end

# # def make_certifications
# #   %w[organic usda biodynamic].each do |certification|
# #     certification = Certification.new(
# #       name: certification, 
# #       description: Faker::Lorem.paragraphs.to_s,
# #       url: Faker::Internet.domain_name
# #     )
# #     certification.save
# #   end

# #   10.times do |cp|
# #     CertificationsProducer.create(
# #       certification_id: rand(1..10), 
# #       producer_id: rand(1..10)
# #     )
# #   end
# # end

# # def make_appellations

# #   appellation_list.each do |appellation|
# #     appellation = Appellation.new(name: appellation,
# #       # type: ["country", "county", "state", "area"].sample,
# #       description: Faker::Lorem.sentence
# #       )
# #     appellation.save!
# #   end
# # end

# # def make_showcases

# #   wine_lists = ["Chez Panisse wines", "Breggo Wines", "Vintage Berkeley"]
# #   wine_lists.each do |list|
# #     Showcase.create(
# #       version: Time.now,
# #       name: list,
# #       description: Faker::Lorem.sentence
# #     )
# #   end

# #   10.times do 
# #     ShowcasesWine.create(
# #       wine_id: rand(1..100),
# #       showcase_id: 1
# #     )
# #   end
# # end

