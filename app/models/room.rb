class Room < ActiveRecord::Base
  AVALAIBLE_STATUS= "avalaible"
  BUSY_STATUS= "busy"
  RESERVED_STATUS= "reserved"
  WAITING_FOR_TRANSFER_STATUS= "waiting_for_transfer"
  DEFAULT_URL= "missing/original/missing.png"
  
  scope :avalaible, where(status: AVALAIBLE_STATUS)
  scope :busy, where(status: BUSY_STATUS)
  scope :reserved, where(status: RESERVED_STATUS) 
  scope :waiting_for_transfer, where(status: WAITING_FOR_TRANSFER_STATUS)
  
  attr_accessible :description, :dimension, :name, :status, :sleeping, :number_of_rooms, :day_price, :week_price 
  attr_accessible :image
  has_attached_file :image, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_2, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_3, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_4, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_5, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }

  has_and_belongs_to_many :stays
  
  validates_presence_of :name
  validates :name, :uniqueness => true
  
  def is_reserved? stay
    reserved=false
    room_stays= self.stays
    if self.stays.empty?
      return reserved
    end
    room_stays.each do |stay_to_compare|
      if stay_to_compare.arrival_date < stay.arrival_date && stay.arrival_date < stay_to_compare.departure_date 
        reserved=true
      end
    end
    return reserved
  end 

  def book!
    self.update_attribute("status", RESERVED_STATUS)
  end

  def wait_for_transfer
    self.update_attribute("status", WAITING_FOR_TRANSFER_STATUS)
  end
  
end
