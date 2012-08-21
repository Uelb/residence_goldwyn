# encoding:utf-8
class Stay < ActiveRecord::Base
  attr_accessible :arrival_date, :departure_date, :number_of_adults, :number_of_children     
  
  belongs_to :user
  has_and_belongs_to_many :rooms, :before_add => :verify_avalaibility
  validates :number_of_adults, :numericality => {:greater_than_or_equal_to => 1}   
  validates_presence_of :arrival_date, :number_of_adults
  before_save :verify_dates
  
  
  def verify_dates
    if (self.departure_date != nil && self.departure_date < self.arrival_date) || self.number_of_adults < 1
      return false
    end
  end
  
  def verify_avalaibility(room)
    p room 
    p room.status
    p room.status != "avalaible"
    if room.status != "avalaible"
      raise "Cette chambre n'est pas disponible"
    elsif self.rooms.include? room
      raise "Cette chambre est déja inclue dans ce séjour"
    end
  end
  
  
end
