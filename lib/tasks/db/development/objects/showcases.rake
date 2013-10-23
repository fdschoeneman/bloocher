namespace 'db:development:create' do 

  task showcases: :environment do
  end

end

# # def make_showcases

# #   wine_lists = ["Chez Panisse wines", "Breggo Wines", "Vintage Berkeley"]
# #   wine_lists.each do |list|
# #     Showcase.create(
# #       version: Time.now,
# #       name: list,
# #       description: Faker::Lorem.sentence
# #     )
# #   end