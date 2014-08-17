namespace 'db:development:create' do 

  task images: :environment do

    imageable_models = %w[producer winery vineyard wine artist showcase user] 
    satisfy_dependencies(imageable_models)

    imageable_models.each do |imageable_model|

      im = imageable_model.classify.constantize
      im.all[0..1].each do |object|


        object.images.create(
            title: Faker::Stoked.place,
            description: Faker::Stoked.sentence,
            image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'support', 'dummies', 'ella.jpg')),            
            user_id: 1
          )
        2.times do |i|
          object.images.create(
            title: Faker::Stoked.place,
            description: Faker::Stoked.sentence,
            image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'support', 'dummies', 'placeholder_big.png')),            
            user_id: 1
          )
        end

        unless imageable_model == "user"
            object.carousels.create(name: Faker::Stoked.adjective)
          object.images.each do |image|
            object.carousels.last.carousels_images.create(
              image_id: image.id
            )
          end
        end
      end
    end
  end
end