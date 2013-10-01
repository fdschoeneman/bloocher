namespace 'db:development' do 

  task appellations_vineyards: :environment do

  	@appellations_vineyards.to_i.times do |i|

  		AppellationsVineyard.create(
  			appellation_id: rand(0..@appellations),
  			vineyard_id: i+1
  		)
  	end
  end
end
