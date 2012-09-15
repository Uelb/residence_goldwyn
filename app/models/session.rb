class Session < ActiveRecord::Base
  before_destroy :check_if_stay_paid
  
  def self.sweep(time = 20.minutes)
    if time.is_a?(String)
      time = time.split.inject { |count, unit| count.to_i.send(unit) }
    end
 
    destroy_all "updated_at < '#{time.ago.to_s(:db)}'"
  end
  
  def check_if_stay_paid
    if self[:stay_id].nil?
      return true
    else
      s= Stay.find self[:stay_id]
      if !s.paid? && agency_id.nil?
        s.destroy
      end
    end
  end
end