namespace 'db:development:create' do 

  task vineyards: :environment do
  end

end

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
