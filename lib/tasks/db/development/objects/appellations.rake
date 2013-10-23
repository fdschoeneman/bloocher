namespace 'db:development:create' do 

  task appellations: :environment do

  	def appellations
  		[
  			"Anderson Valley",
  			"Cole Ranch",
  			"Redwood Valley"
  				]
  			end

  	
  end
end




# # def make_appellations

# #   appellation_list.each do |appellation|
# #     appellation = Appellation.new(name: appellation,
# #       # type: ["country", "county", "state", "area"].sample,
# #       description: Faker::Lorem.sentence
# #       )
# #     appellation.save!
# #   end
# # end
