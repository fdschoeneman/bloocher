namespace 'db:development:create' do 

  task producers: :environment do 

    Faker::Bloocher.producers.each do |producer_name|
      producer = Producer.create(
        name: producer_name
      )
      small_notice("producer: #{producer.name}")
    end
  end
end