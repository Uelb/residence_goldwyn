include Clockwork

every(1.hour, 'session:sweep') { system "bundle exec rake session:sweep" }

every(1.day, 'rooms:check_avalaibility', :at => "08:00") { system "bundle exec rake rooms:check_avalaibility"}