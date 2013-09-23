namespace 'db:development' do 

  task wineries: :environment do 

    boonville_wineries.each do |winery_name|

      small_notice("winery: #{winery_name}")
      Winery.create(
        name: winery_name, 
        producer_id: rand(1..4)
      )
    end
  end
end