namespace 'db:development:create' do 

  task images: :environment do

    imageable_models = %w[producer]

    imageable_models.each do |im|

#       debugger 
# []
    end
  end
end
    

#     @images.to_i.times do |image|
#       Image.new(
#         title: Faker::Stoked.place,
#         description: Faker::Stoked.sentence,
#         )
#   end

# end
