namespace 'db:development:create' do 

  task certifications_holdables: :environment do

    small_notice("join certifications to holdables")

    %w[@producers @users @vineyards @wineries].each do |count|

      eval(count).times do |i|
        model = count.gsub("@", "").capitalize.singularize
        small_notice("certifications for #{model}")
        CertificationsHoldable.create(
          certification_id: rand(1..@addresses.to_i),
          holdable_id: i + 1,
          holdable_type: model
        )
      end
    end
  end
end