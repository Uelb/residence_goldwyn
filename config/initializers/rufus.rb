require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '20m' do
	puts 'Sweep sessions'
   	Session.sweep
end