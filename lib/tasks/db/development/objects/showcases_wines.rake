namespace 'db:development:create' do 

  task showcases_wines: :environment do

    satisfy_dependencies(["showcase", "review"])

    reviews = Review.all

    Showcase.all.each do |showcase|
      reviews.each do |review|
        showcase.showcase!(review.wine.id)
      end 
    end
  end
end