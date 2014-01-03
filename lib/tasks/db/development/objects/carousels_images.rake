namespace 'db:development:create' do 

  task carousels_images: :environment do

  	satisfy_dependencies(["carousel"])
  end
end
