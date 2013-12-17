namespace 'db:development:create' do 

  task showcases: :environment do

    return if Showcase.count > @showcases.to_i

    showcaseable_models = %w[user winery user producer]
    showcaseable_models.each do |showcaseable_model|

      count = (@showcases.to_i / showcaseable_models.size)
      count.times do |showcase|

        objects = showcaseable_model.classify.constantize.all[1..count]
        objects.each do |object|
          year = rand(1980..2013)
          appellation = Faker::Bloocher.appellation
          varietal = Faker::Bloocher.varietal
          object.showcases.create(
            version: Time.now,
            name: [year, appellation, varietal].join(" ") + "s",
            description: Faker::Stoked.sentence
          )
        end
      end
    end
  end
end