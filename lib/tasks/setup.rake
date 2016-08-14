# Rake setup will mostly do initial db migration
# stuff.
#
# i.e: rake db:create && rake db:migrate
task :setup => :setupdb do
  system("#{Rails.root.to_s}/script/setup.sh")
end

task :setupdb do
  system("rake db:drop db:create db:migrate")
end

