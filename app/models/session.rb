class Session < ActiveRecord::Base
  before_destroy :check_if_stay_paid
  
  def self.sweep(time = 20.minutes)
    if time.is_a?(String)
      time = time.split.inject { |count, unit| count.to_i.send(unit) }
    end
 
    destroy_all "updated_at < '#{time.ago.to_s(:db)}'"
  end
  
  def check_if_stay_paid
    stay = Stay.find self[:stay_id] rescue return true
    if stay.nil? || !stay.paid? && !stay.waiting_for_transfer && stay.agency.nil?
      return true
    else
      return false
    end
  end
end