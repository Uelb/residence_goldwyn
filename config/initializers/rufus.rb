require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '5m' do
	puts 'Sweep sessions'
   	Rake::Task["session:sweep"].invoke
end

scheduler.cron '0 4 * * 1-5' do
  # every day of the week at 4:00 (4am)
  puts 'Check rooms avalaibility'
  Rake::Task["rooms:check_avalaibility"].invoke
end