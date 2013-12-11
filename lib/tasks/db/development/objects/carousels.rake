namespace 'db:development:create' do 

  task carousels: :environment do

    medium_notice("carousels")

    satisfy_dependencies(["user", "images"])

    carousable_models = %w[producer winery vineyard wine artist showcase]

    carousable_models.each do |carousable_model|

      @carousels.to_i.times do |carousel|

        carousable_model.classify.constantize.all[0..@carousels.to_i].each do |object|
          carousel = object.carousels.create(
            name: Faker::Stoked.adjective
          )
          carousel.save
          object.images.each do |image|
            carousel.carousels_images.create(
              image_id: image.id
            )
          end
        end
      end
    end
  end
end
