namespace 'db:development:create' do 

  task showcases: :environment do

    showcaseable_models = %w[user winery user producer]
    showcaseable_models.each do |showcaseable_model|

      @showcases.to_i.times do |showcase|

        objects = showcaseable_model.classify.constantize.all[0..@showcases.to_i]
        objects.each do |object|
          object.showcases.create(
            version: Time.now,
            name: %w[year appellation varietal].join(" ") + "s",
            description: Faker::Stoked.sentence
          )
        end
      end
    end
  end
end