namespace 'db:development' do 

  desc "Kill existing database connections"
  if Rails.env.development?
    task kill_connections: :environment
      
      puts "#{green("==>")} killing development db connections"
      
      db_name = "#{File.basename(Rails.root)}_#{Rails.env}"
      sh = <<EOF
ps xa \
  | grep postgres: \
  | grep #{db_name} \
  | grep -v grep \
  | awk '{print $1}' \
  | xargs kill
EOF
      puts `#{sh}`
    end

    task "db:drop:all" => :kill_connections
end