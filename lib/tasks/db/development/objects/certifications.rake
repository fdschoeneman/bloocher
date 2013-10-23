namespace 'db:development:create' do 

  task certifications: :environment do

  	certification_names = %w[organic biodynamic]

  	certification_names.each do |name|
  		Certification.create(
  			name: name,
  			description: Faker::Lorem.sentence,
  			url: Faker::Internet.domain_name
  		)
  	end
  end
end

# # def make_certifications
# #   %w[organic usda biodynamic].each do |certification|
# #     certification = Certification.new(
# #       name: certification, 
# #       description: Faker::Lorem.paragraphs.to_s,
# #       url: Faker::Internet.domain_name
# #     )
# #     certification.save
# #   end

# #   10.times do |cp|
# #     CertificationsProducer.create(
# #       certification_id: rand(1..10), 
# #       producer_id: rand(1..10)
# #     )
# #   end
# # end