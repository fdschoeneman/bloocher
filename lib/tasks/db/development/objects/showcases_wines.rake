namespace 'db:development:create' do 

  task showcases_wines: :environment do

	  100.times do 
	    ShowcasesWine.create(
	      wine_id: rand(1..@wine.to_i),
	      showcase_id: rand(1..@showcase.to_i)
	    )
	  end
  end
end
