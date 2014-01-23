namespace 'db:development:create' do 

  task artists: :environment do

    small_notice("artists")

    @artists.to_i.times do |i|

      Artist.create(
        artist_id: i+1,
        statement: Faker::Stoked.bio
      )
    end
  end
end


