namespace 'db:development:create' do 

  task certifications: :environment do

    satisfy_dependencies(%w[vineyard wine user winery producer])
    
    vcf = CertifyingBody.create(

      name: "USDA",
      mission: Faker::Stoked.sentences(1),
      url: Faker::Internet.url
    )
    
    certification = vcf.certifications.create(
      certification_type: "organic",
      description: Faker::Stoked.paragraph
    )

    Vineyard.all[0..4].each do |vineyard|
      ch = certification.certifications_holdables.new(
        holdable_id: vineyard.id,
        holdable_type: "Vineyard",
        inception: Date.today,
        grade: "standard"
      )
      ch.save
    end
  end
end