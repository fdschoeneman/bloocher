namespace 'db:development' do

  desc "Create working objects in development db"

  task :create_objects do
    Rake.application.in_namespace('db:development:create') do |x| 
      x.tasks.each do |t| 
        medium_notice(t.name)
        t.invoke
      end
    end
  end
end

  # task :create_objects do
  #   Rake.application.in_namespace('db:development') do |x| 
  #     x.tasks.each{|t| t.invoke}
  #   end
    # big_notice(task)
    # %w[accounts accounts_activations accounts_admins activations addresses 
    #   roles users producers wineries wines reviews].each do |subtask|
    #   medium_notice(subtask)

    #   debugger

    #   Rake::Task["db:development:#{subtask}"].invoke
    # end
  # end  

  # task :db:development do
  #   Rake.application.in_namespace(:db:development){|x| x.tasks.each{|t| t.invoke}}
  # end
# end

    # def make_addresses
    
    #   %w[producer user vineyard winery].each do |addressable_type|

    #     Address.create(
    #       address_1: Faker::Address.street_address,
    #       address_2: Faker::Address.secondary_address,
    #       city: Faker::Address.city,
    #       state: "CA",
    #       zip: Faker::Address.zip_code,
    #       country: "United States",
    #       public_phone: Faker::PhoneNumber,
    #       public_email: Faker::Internet.email,
    #       public_url: Faker::Internet.domain_name,
    #       addressable_type: addressable_type.capitalize,
    #       addressable_id: 1
    #     )
    #   end
    # end






# def make_user(email)
  
#   user = User.new(
#     email: email, 
#     password: "password",
#     password_confirmation: "password", 
#     bio: hipster_bios.first)
#   user.skip_confirmation!
#   user.save
#   user.confirm!
#   user.add_role :VIP
# end

# def make_admin_user

#   user = User.new(
#     name: "Fred Schoeneman", 
#     email: "fred.schoeneman@gmail.com", 
#     password: "password",
#     password_confirmation: "password", 
#     bio: hipster_bios.first)

#   user.save!
#   user.confirm!
#   user.add_role :admin
# end

# def make_users

#   99.times do |n|
#     name = Faker::Name.name 
#     email = Faker::Internet.email
#     password  = "password"
#     user = User.new(name: name,
#                     :email => email,
#                     :password => password,
#                     bio: Faker::Company.bs)  
#     user.skip_confirmation!
#     user.save!
#     user.confirm!
#   end
# end

# def make_wineries

#   boonville_wineries.each do |winery_name|
#     Winery.create(
#       name: winery_name, 
#       producer_id: rand(1..20)
#     )
#   end
# end

# def make_wines
  
#   99.times do |n|
#     vintage = rand(2002..2011)
#     bottled_on_year = vintage + 1
#     released_on_year = vintage + rand(1..2)
#     lay_down_until_year = vintage + rand(1..4)
#     drink_before_year = vintage + rand(10..20)
#     new_french_oak = (rand(0..100).to_f)/100
#     wine = Wine.new( 
#       vintage: vintage,
#       cases_produced: rand(2000..100000),
#       name: "#{wine_types.sample} \- #{vineyard_names.sample} \- #{differentiators.sample}",
#       winery_id: rand(1..28),   
#       acid_added: rand(0..1),
#       new_french_oak: rand(1..100),
#       days_in_oak: rand(90..180),
#       bottled_on: "#{bottled_on_year}-#{rand(1..12)}-#{rand(1..30)}",
#       released_on: "#{released_on_year}-#{rand(1..12)}-#{rand(1..30)}",
#       category: wine_types.sample,
#       winemaker_notes: Faker::Lorem.sentence(8),
#       ph: "#{(rand(665..755).to_f)/100}",
#       residual_sugar: "#{(rand(1..5).to_f)/100}",
#       alcohol: "#{(rand(125..175).to_f)/1000}",
#       one_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
#       new_french_oak: new_french_oak,
#       two_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
#       three_yr_old_french_oak: "#{(100 - new_french_oak)/7}",
#       new_american_oak: "#{(100 - new_french_oak)/7}",
#       one_yr_old_american_oak: "#{(100 - new_french_oak)/7}",
#       two_yr_old_american_oak: "#{(100 - new_french_oak)/7}",
#       three_yr_old_american_oak: "#{(100 - new_french_oak)/7}"
#     )

#     wine.save
#   end
# end

# def make_reviews 
#   99.times do |n|
#     Review.create(
#       rating: rand(70..95),
#       reviewer_id: rand(1..99),
#       wine_id: rand(1..99),
#       # content: Faker::Lorem.paragraphs
#       content: hipster_review
#     )
#   end
# end

# def make_producers
#   20.times do |n|
#     name = boonville_producers.sample
#     subdomain = name.gsub(" ", "-")
#     web_address = "http://www." + subdomain + "." + Faker::Internet.domain_suffix
#     Producer.create(
#       name: name
#     )
#   end
# end

# def make_vineyard

#   block_planting_year = rand(1955..2010)
#   block_grafting_year = block_planting_year + rand(0..3)
#   @vineyard = Vineyard.new(
#     topo_aspect: topo_aspects.sample,
#     topo_slope: rand(1..50)/1000.to_f,
#     topo_elevation: rand(10..8000),
#     soil_composition: soil_types.sample,
#     soil_drainage: soil_drainage_types.sample,
#     soil_depth: rand(18..40),
#     soil_fertility: rand(1..40)/1000.to_f,
#     soil_water_capacity: rand(6..8),
#     soil_ph: rand(38..80)/10.to_f,
#     rootstock: rootstock.sample,
#     varietal: varietals.sample,
#     clone: clones.sample,
#     planted_on: rand(1955..2010),
#     irrigation: irrigation_types.sample,
#     nursery: nurseries.sample,
#     planted_on: block_planting_year,
#     grafted_on: block_grafting_year
#   )
# end

# def make_vineyard_parents

#   boonville_vineyards.each do |vineyard_name|
#     make_vineyard
#     @vineyard.update_attributes(
#       name: vineyard_name,
#       producer_id: rand(1..20)
#     )
#     @vineyard.save
#   end
# end

# def make_vineyard_blocks

#   20.times do |block|
#     make_vineyard
#     block_name = %w[east west north southeast creekside river hillside 1A 2A].sample
#     @vineyard.update_attributes(
#       name: block_name, 
#       producer_id: rand(1..10),
#       vineyard_parent_id: rand(1..10)
#     )
#     @vineyard.save
#   end
# end

# def make_vineyard_vintages

#   20.times do |vintage|
#     day = rand(1..15)
#     month = [4,5].sample
#     year = rand(2009..2012)
#     last_frost = Time.new(year, month, day) 
#     bud_break = Time.new(year, month, day + 13)
#     bloom_date = Time.new(year, month + 1, day)
#     veraison = Time.new(year, month + 2, day)
#     VineyardVintage.create(
#       vineyard_id: rand(1..40),
#       growing_degree_days: rand(1800..2500),
#       days_above_100: rand(2..20),
#       last_frost: last_frost,
#       bud_break: bud_break,
#       bloom_date: bloom_date,
#       veraison: veraison,
#       average_yearly_rel_hum: rand(60..75)/100.to_f
#     )
#   end
# end

# def make_fruit_lots

#   20.times do |fruit_lot|
#     random_day = rand(1..28)
#     harvest_date = Date.new(2012, 8, random_day)
#     FruitLot.create(
#       brix: rand(150..250)/10.to_f,
#       weight: rand(25..250)/100.to_f,
#       harvest_date: harvest_date,
#       vineyard_vintage_id: rand(1..40)
#     )
#   end
# end

# def make_wine_fruit_lots

#   20.times do |wine_fruit_lot|
#     WineFruitLot.create!(
#       wine_id: rand(1..20),
#       percent_of_wine: rand(20..100),
#       fruit_lot_id: rand(1..20)
#     )
#   end
# end

# def make_certifications
#   %w[organic usda biodynamic].each do |certification|
#     certification = Certification.new(
#       name: certification, 
#       description: Faker::Lorem.paragraphs.to_s,
#       url: Faker::Internet.domain_name
#     )
#     certification.save
#   end

#   10.times do |cp|
#     CertificationsProducer.create(
#       certification_id: rand(1..10), 
#       producer_id: rand(1..10)
#     )
#   end
# end

# def make_appellations

#   appellation_list.each do |appellation|
#     appellation = Appellation.new(name: appellation,
#       # type: ["country", "county", "state", "area"].sample,
#       description: Faker::Lorem.sentence
#       )
#     appellation.save!
#   end
# end

# def make_showcases

#   wine_lists = ["Chez Panisse wines", "Breggo Wines", "Vintage Berkeley"]
#   wine_lists.each do |list|
#     Showcase.create(
#       version: Time.now,
#       name: list,
#       description: Faker::Lorem.sentence
#     )
#   end

#   10.times do 
#     ShowcasesWine.create(
#       wine_id: rand(1..100),
#       showcase_id: 1
#     )
#   end
# end

