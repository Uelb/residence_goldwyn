class Room < ActiveRecord::Base
  AVALAIBLE_STATUS= "avalaible"
  BUSY_STATUS= "busy"
  RESERVED_STATUS= "reserved"
  WAITING_FOR_TRANSFER_STATUS= "waiting_for_transfer"
  DEFAULT_URL= "missing/original/missing.png"
  
  attr_accessible :description, :dimension, :name, :status, :sleeping, :number_of_rooms, :day_price, :week_price 
  attr_accessible :image
  has_attached_file :image, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_2, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_3, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_4, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :image_5, :default_url => DEFAULT_URL,  :styles => { :medium => "300x300>", :thumb => "100x100>" }

  has_and_belongs_to_many :stays
  
  validates_presence_of :week_price, unless: :day_price?
  validates :name, :uniqueness => true
  
  def is_reserved? stay
    important_stays = self.stays.paid + self.stays.waiting_for_transfer
    important_stays.each do |important_stay|
      if (important_stay.arrival_date >= stay.arrival_date && important_stay.arrival_date <= stay.departure_date) || (important_stay.departure_date >= stay.arrival_date && important_stay.departure_date <= stay.departure_date)
        return true
      end
    end
    return false
  end 

  def day_price?
    !self.day_price.nil?
  end

end
