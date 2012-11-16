class Room < ActiveRecord::Base
  AVALAIBLE_STATUS= "avalaible"
  BUSY_STATUS= "busy"
  RESERVED_STATUS= "reserved"
  WAITING_FOR_TRANSFER_STATUS= "waiting_for_transfer"
  
  scope :avalaible, where(status: AVALAIBLE_STATUS)
  scope :busy, where(status: BUSY_STATUS)
  scope :reserved, where(status: RESERVED_STATUS) 
  scope :waiting_for_transfer, where(status: WAITING_FOR_TRANSFER_STATUS)
  
  attr_accessible :description, :dimension, :name, :status, :sleeping, :number_of_rooms, :day_price, :week_price 
  attr_accessible :image
  has_attached_file :image, :default_url => "missing/original/missing.png",  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_2, :default_url => "missing/original/missing.png",  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_3, :default_url => "missing/original/missing.png",  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_4, :default_url => "missing/original/missing.png",  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_5, :default_url => "missing/original/missing.png",  :styles => { :medium => "300x300>", :thumb => "100x100>" }

  has_and_belongs_to_many :stays
  
  validates_presence_of :name
  validates :name, :uniqueness => true
  
  def is_reserved? stay
    room_stays= self.stays
    if self.stays.empty?
      return false
    end
    return room_stays.map(&:departure_date).max < stay.arrival_date && room_stays.map(&:arrival_date).min > stay.departure_date
  end 

  def book!
    self.update_attribute("status", RESERVED_STATUS)
  end

  def wait_for_transfer
    self.update_attribute("status", WAITING_FOR_TRANSFER_STATUS)
  end
  
end
