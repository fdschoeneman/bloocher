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


# # def make_wine_fruit_lots

# #   20.times do |wine_fruit_lot|
# #     WineFruitLot.create!(
# #       wine_id: rand(1..20),
# #       percent_of_wine: rand(20..100),
# #       fruit_lot_id: rand(1..20)
# #     )
# #   end
# # end
