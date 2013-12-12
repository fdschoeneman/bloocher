namespace 'db:development:create' do 

  task images: :environment do

    imageable_models = %w[producer winery vineyard wine artist showcase]
    satisfy_dependencies(imageable_models << "user")

    imageable_models.each do |imageable_model|
      @images.to_i.times do |image|

        imageable_model.classify.constantize.all[0..@images.to_i].each do |object|
          
          object.images.create(
            title: Faker::Stoked.place,
            description: Faker::Stoked.sentence,
            image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'support', 'dummies', 'ella.jpg')),            
            user_id: 1
          )
        end
      end
    end
  end
end