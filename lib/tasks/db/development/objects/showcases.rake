namespace 'db:development:create' do 

  task showcases: :environment do

    showcaseable_models = %w[user winery vineyard]
    showcaseable_models.each do |showcaseable_model|

      sm = showcaseable_model.classify.constantize
      sm.all[0..1].each do |object|
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
