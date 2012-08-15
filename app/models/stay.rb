class Stay < ActiveRecord::Base
  attr_accessible :arrival_date, :departure_date, :number_of_adults, :number_of_children     
  
  belongs_to :user
  has_and_belongs_to_many :rooms
  validates :number_of_adults, :numericality => {:only_integer => true, :greater_than_or_equal_to => 1}, :presence => true   
  validates_presence_of :arrival_date
  before_save :verify_dates
  
  
  def verify_dates
    if (self.departure_date != nil && self.departure_date < self.arrival_date) || self.number_of_adults < 1
      return false
    end
  end
  
  
end
