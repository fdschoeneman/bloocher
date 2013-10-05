namespace 'db:development:create' do 

  task fruit_lots_wines: :environment do

  	@fruit_lots_wines.to_i.times do |i|

  		FruitLotsWine.create(
  			wine_id: i+1,
  			fruit_lot_id: i+1,
  			percent_of_wine: rand(1..100)
  		)
  	end
  end
end
