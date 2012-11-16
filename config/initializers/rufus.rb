require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '5m' do
	puts 'Sweep sessions'
   	Session.sweep
end

scheduler.cron '0 4 * * 1-5' do
  # every day of the week at 4:00 (4am)
  puts 'Check rooms avalaibility'
  Stay.where("departure_date < (?)", Time.now).rooms.each do |room|
      room.update_attribute("status", Room::AVALAIBLE_STATUS)
  end
  Stay.waiting_for_transfer.each do |stay|
  	if (Time.now - stay.created_at) > 4.days
  		stay.alert_user
    end
  end
end