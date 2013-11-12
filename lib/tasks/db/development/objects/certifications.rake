namespace 'db:development:create' do 

  task certifications: :environment do

  	certification_names = %w[organic usda biodynamic]

  	certification_names.each do |name|
  		Certification.create(
  			name: name,
  			description: Faker::Lorem.sentence,
  			url: Faker::Internet.domain_name
  		)
  	end
  end
end