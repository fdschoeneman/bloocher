namespace 'db:development:create' do 

  task carousels: :environment do

    %w[producer winery vineyard wine artist showcase].each do |carousable_model|

      @carousels.to_i.times do |n|
        Carousel.create(
          carousable_type: carousable_model.classify,
          carousable_id: rand(1..eval("@"+carousable_model.pluralize)),
          image_id: rand(1..@images.to_i)
        )
      end
    end
  end
end
