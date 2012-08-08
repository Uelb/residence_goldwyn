class Stay < ActiveRecord::Base
  attr_accessible :arrival_date, :departure_date     
  
  belongs_to :user
  has_and_belongs_to_many :rooms 
  validates_presence_of :arrival_date, :user_id 
  before_save :verify_dates
  
  
  def verify_dates
    if self.departure_date != nil && self.departure_date < self.arrival_date
      return false
    end
  end
  
  
end
