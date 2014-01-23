namespace 'db:development:create' do 

  task vineyards: :environment do

  	satisfy_dependencies(["producer"])
	
		@vineyard_parents = ( @vineyards.to_i / 5 )
		@blocks = ( @vineyards.to_i - @vineyard_parents.to_i ) 

		def make_vineyard

		  block_planting_year = rand(1955..2010)
		  block_grafting_year = block_planting_year + rand(0..3)
		  @vineyard = Vineyard.new(
		  	producer_id: rand(1..4),
		    topo_aspect: Faker::Bloocher.topo_aspect,
		    topo_slope: rand(1..50)/1000.to_f,
		    topo_elevation: rand(10..8000),
		    soil_composition: Faker::Bloocher.soil_type,
		    soil_drainage: Faker::Bloocher.soil_drainage_type,
		    soil_depth: rand(18..40),
		    soil_fertility: rand(1..40)/1000.to_f,
		    soil_water_capacity: rand(6..8),
		    soil_ph: rand(38..80)/10.to_f,
		    rootstock: Faker::Bloocher.rootstock,
		    varietal: Faker::Bloocher.varietal,
		    clone: Faker::Bloocher.clone,
		    planted_on: rand(1955..2010),
		    irrigation: Faker::Bloocher.irrigation_type,
		    nursery: Faker::Bloocher.nursery,
		    planted_on: block_planting_year,
		    grafted_on: block_grafting_year
		  )
		end


	  Faker::Bloocher.vineyards[1..@vineyard_parents.to_i].each do |vineyard_name|
	    make_vineyard
	    @vineyard.update_attributes(
	      name: vineyard_name,
	      producer_id: rand(1..4)
	    )
	    
	    @vineyard.save
	  end

	  @blocks.to_i.times do |block|
	    make_vineyard
	    block_name = %w[east west north southeast creekside river hillside 1A 2A].sample
	    @vineyard.update_attributes(
	      name: block_name, 
	      vineyard_parent_id: rand(1..3)
	    )
	    @vineyard.save
		end
  end
end
