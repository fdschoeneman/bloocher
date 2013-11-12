namespace 'db:development:create' do 

  task showcases: :environment do

  	@showcases.to_i.times do |i|

    	year = rand(1972...2011)
      varietal = Faker::Bloocher.varietal 
      appellation = Faker::Bloocher.varietal 

  		Showcase.create(
  			sommelier_id: rand(1..@users.to_i),
  			version: Time.now,
  			title: %w[year appellation varietal].join(" ") + "s",
  			description: Faker::Stoked.bio
  		)
  	end
  end
end
