namespace 'db:development:create' do 

  task wines: :environment do 
    @wines.to_i.times do |n|
      vintage = rand(2002..2011)
      bottled_on_year = vintage + 1
      released_on_year = vintage + rand(1..2)
      lay_down_until_year = vintage + rand(1..4)
      drink_before_year = vintage + rand(10..20)
      new_french_oak = (rand(0..100).to_f)/100
      wine = Wine.new( 
        vintage: vintage,
        cases_produced: rand(2000..100000),
        name: "#{Faker::Bloocher.varietal} \- #{Faker::Bloocher.vineyard} \- #{Faker::Bloocher.differentiator}",
        winery_id: 1,   
        acid_added: rand(0..1),
        new_french_oak: rand(1..100),
        days_in_oak: rand(90..180),
        bottled_on: "#{bottled_on_year}-#{rand(1..12)}-#{rand(1..30)}",
        released_on: "#{released_on_year}-#{rand(1..12)}-#{rand(1..30)}",
        category: Faker::Bloocher.varietal,
        # winemaker_notes: Faker::Lorem.sentence(8),
        winemaker_notes: Faker::Bloocher.review,
        ph: "#{(rand(665..755).to_f)/100}",
        residual_sugar: "#{(rand(1..5).to_f)/100}",
        alcohol: "#{(rand(125..175).to_f)/1000}",
        one_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
        new_french_oak: new_french_oak,
        two_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
        three_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
        new_american_oak: "#{(100 - new_french_oak)/7}",
        one_yr_old_american_oak: "#{(100 - new_french_oak)/7}",
        two_yr_old_american_oak: "#{(100 - new_french_oak)/7}",
        three_yr_old_american_oak: "#{(100 - new_french_oak)/7}"
      )
      wine.save
      small_notice("wine: #{wine.name}")
    end
  end
end