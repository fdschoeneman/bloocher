namespace 'db:development:create' do 

  task fruit_lots: :environment do
  end
end
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