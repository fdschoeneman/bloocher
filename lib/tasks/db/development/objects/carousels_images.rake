namespace 'db:development:create' do 

  task carousels_images: :environment do

  	@carousels_images.to_i.times do |i|

  		CarouselsImage.create(
  			carousel_id: rand(0..@carousels.to_i),
  			image_id: rand(1..@images.to_i)
  		)
  	end
  end
end
