namespace 'db:development:create' do 

  task showcases: :environment do

    %w[@vineyards @producers @wineries @users].each do |count|

      eval(count).times do |i|
        model = count.gsub("@", " ").capitalize.singularize
        showcase = Showcase.create(
          showcaseable_id: i+1,
          showcaseable_type: model,
          version: Time.now,
  			  title: %w[year appellation varietal].join(" ") + "s",
  	      description: Faker::Stoked.bio
        )
      end
  	end
  end
end
