namespace 'db:development' do 

  task reviews: :environment do 

    99.times do |n|
      review = Review.new(
        rating: rand(70..95),
        reviewer_id: rand(1..@users_count),
        wine_id: rand(1..5),
        content: hipster_review
      )
      review.save
      small_notice("review: #{review.wine.name}")
    end
  end
end