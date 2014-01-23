namespace 'db:development:create' do 

  task reviews: :environment do 

    satisfy_dependencies(["user", "wine"])
    @reviews.to_i.times do |n|
      review = Review.new(
        rating: rand(70..95),
        reviewer_id: rand(3..@users.to_i),
        wine_id: rand(1..5),
        content: Faker::Bloocher.review
      )
      review.save
      small_notice("review: #{review.content.truncate(15)}")
    end
  end
end