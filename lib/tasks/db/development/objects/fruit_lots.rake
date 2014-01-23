namespace 'db:development:create' do 

  task fruit_lots: :environment do

    satisfy_dependencies(%w[vineyards_vintage])
    
    @fruit_lots_wines.to_i.times do |fruit_lot|
      random_day = rand(1..28)
      harvest_date = Date.new(2012, 8, random_day)
      FruitLot.create(
        brix: rand(150..250)/10.to_f,
        weight: rand(25..250)/100.to_f,
        harvest_date: harvest_date,
        vineyards_vintage_id: rand(1..VineyardsVintage.count)
      )
    end
  end
end
