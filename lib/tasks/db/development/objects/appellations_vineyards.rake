namespace 'db:development:create' do 

  task appellations_vineyards: :environment do

  	@appellations_vineyards.to_i.times do |i|

  		AppellationsVineyard.create(
  			appellation_id: rand(0..@appellations.to_i),
  			vineyard_id: i+1
  		)
  	end
  end
end
