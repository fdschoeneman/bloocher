namespace 'db:development:create' do 

  task positions: :environment do

    positionables = %w[vineyard winery producer artist wine]
    
    satisfy_dependencies(positionables + ["user"])

    positionables.each do |positionable|

      pm = positionable.classify.constantize

      titles = %w[winemaker sales farmer owner labor bookkeeper]

      pm.all[0..2].each do |object|

        user_count = User.count

        5.times do 

          begin_date = (Date.today - rand(1..1000).days)
          end_date = (begin_date + rand(1..6).years)
          Position.create(
            user_id: rand(1..user_count),
            positionable_id: object.id,
            positionable_type: object.class.name,
            title: titles.sample,
            tenure_start: begin_date,
            tenure_end: end_date
          )
        end
      end
    end
  end
end
