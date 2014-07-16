require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '20m' do
	puts 'Sweep sessions'
   	Session.sweep
end