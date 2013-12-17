namespace 'db:development:create' do 

  task showcases_wines: :environment do

    satisfy_dependencies(["showcase", "review"])

    Showcase.all.each do |showcase|

      @showcases_wines.to_i.times do |sw|
        blurb = Review.where(id: rand(1..Review.count)).first
        showcase.showcase!(blurb.id)
      end
    end
  end
end