namespace 'db:development:create' do 

  task appellations: :environment do

    satisfy_dependencies(["vineyard"])

    Faker::Bloocher.appellations.each do |appellation_name|
      Appellation.create(
        name: appellation_name,
        description: Faker::Stoked.paragraph
      )
    end

    Vineyard.all.each do |vineyard|
      vineyard.appellations_vineyards.create(appellation_id: rand(1..Appellation.count))
    end
  end
end