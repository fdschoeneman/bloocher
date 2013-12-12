namespace 'db:development:create' do 

  task vineyards_vintages: :environment do

	  20.times do |vintage|
	    day = rand(1..15)
	    month = [4,5].sample
	    year = rand(2009..2012)
	    last_frost = Time.new(year, month, day) 
	    bud_break = Time.new(year, month, day + 13)
	    bloom_date = Time.new(year, month + 1, day)
	    veraison = Time.new(year, month + 2, day)
	    VineyardsVintage.create(
	      vineyard_id: rand(1..@vineyards.to_i),
	      growing_degree_days: rand(1800..2500),
	      days_above_100: rand(2..20),
	      last_frost: last_frost,
	      bud_break: bud_break,
	      bloom_date: bloom_date,
	      veraison: veraison,
	      average_yearly_rel_hum: rand(60..75)/100.to_f
	    )
	  end
	end
end
