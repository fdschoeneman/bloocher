namespace 'db:development:create' do 

  task appellations: :environment do

    @appellations.to_i.times do |n|
      Appellation.create(
        name: Faker::Bloocher.appellation,
        description: Faker::Stoked.bio
      )
    end
  end
end