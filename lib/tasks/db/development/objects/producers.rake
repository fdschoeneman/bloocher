namespace 'db:development' do 

  task producers: :environment do 

    boonville_producers.each do |producer_name|
      producer = Producer.new(
        name: producer_name
      )
      producer.save!

      small_notice("producer: #{producer.name}")
    end
  end
end