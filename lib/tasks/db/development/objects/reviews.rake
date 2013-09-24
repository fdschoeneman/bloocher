namespace 'db:development' do 

  task reviews: :environment do 

    99.times do |n|
      review = Review.new(
        rating: rand(70..95),
        reviewer_id: rand(1..User.count),
        wine_id: rand(1..@user_count),
        content: hipster_review
      )
      review.save
      small_notice("review: #{review.wine.name}")
    end
  end
end