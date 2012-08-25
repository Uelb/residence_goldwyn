namespace :session do
  desc "Sweep session every 20 minutes"
  task :sweep => :environment do
    Session.sweep
  end
end