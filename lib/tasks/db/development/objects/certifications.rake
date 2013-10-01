namespace 'db:development' do 

  task accounts: :environment do

  	certification_names = %w[organic biodynamic]

  	certification_names.each do |name|
  		Certification.create(
  			name: name,
  			description: Faker::Lorem.sentence,
  			url: Faker::Company.url
  		)
  	end
  end
end
