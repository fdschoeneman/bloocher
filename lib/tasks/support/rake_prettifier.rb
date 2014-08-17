module RakePrettifier

	def inflect(method) 
		method.gsub("make", "making")
	end

	def big_notice(task)
	  puts ("==> " + task.name).green
	end

	def medium_notice(task)
	  puts "  --> " + task.light_green
	end

	def small_notice(subject)
	  puts ("    ~- Making " + subject).yellow
	end
end