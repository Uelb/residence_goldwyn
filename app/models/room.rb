class Room < ActiveRecord::Base
  AVALAIBLE_STATUS= "avalaible"
  BUSY_STATUS= "busy"
  RESERVED_STATUS= "reserved"
  
  scope :avalaible, where(status: AVALAIBLE_STATUS)
  scope :busy, where(status: BUSY_STATUS)
  scope :reserved, where(status: RESERVED_STATUS) 
  
  attr_accessible :description, :dimension, :name, :status, :sleeping, :number_of_rooms, :day_price, :week_price 
  
  has_and_belongs_to_many :stays
  
  validates_presence_of :name
  validates :name, :uniqueness => true
  
  def is_reserved? stay
    room_stays= self.stays
    return room_stays.map(&:departure_date).max < stay.arrival_date && room_stays.map(&:arrival_date).min > stay.departure_date
  end 
  
end
