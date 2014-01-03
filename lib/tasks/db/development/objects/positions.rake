namespace 'db:development:create' do 

  task positions: :environment do

    positionables = %w[vineyard winery producer artist wine]
    
    satisfy_dependencies(positionables + ["user"])

    positionables.each do |positionable|

      pm = positionable.classify.constantize

      titles = %w[winemaker sales farmer owner labor bookkeeper]

      pm.all[0..2].each do |object|

        5.times do 

          Position.create(
            user_id: rand(0..@users.to_i),
            positionable_id: object.id,
            positionable_type: object.class.name,
            title: titles.sample)
        end
      end
    end
  end
end
