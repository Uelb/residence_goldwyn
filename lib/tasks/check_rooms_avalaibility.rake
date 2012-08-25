namespace :rooms do
  desc "Check avalaibility each day at 8:00"
  task :check_avalaibility => :environment do
    Stay.where("departure_date < (?)", Time.now).rooms.each do |room|
      room.update_attribute("status", Room::AVALAIBLE_STATUS)
    end
  end
end