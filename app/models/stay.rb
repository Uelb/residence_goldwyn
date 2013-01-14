# encoding:utf-8
class Stay < ActiveRecord::Base
  attr_accessible :arrival_date, :departure_date, :number_of_adults, :number_of_children     
  
  belongs_to :user
  belongs_to :agency
  has_and_belongs_to_many :rooms, :before_add => :verify_avalaibility
  validates :number_of_adults, :numericality => {:greater_than_or_equal_to => 1}   
  validates_presence_of :arrival_date, :number_of_adults
  before_save :verify_dates
  before_destroy :turn_rooms_to_avalaible
  scope :waiting_for_transfer, where(:waiting_for_transfer => true)
  
  def verify_dates
    if (self.departure_date != nil && self.departure_date < self.arrival_date) || self.number_of_adults < 1 || self.arrival_date <= Time.now
      return false
    end
  end
  
  def verify_avalaibility(room)
    if room.status != "avalaible"
      raise "Cette chambre n'est pas disponible"
    elsif self.rooms.include? room
      raise "Cette chambre est déja inclue dans ce séjour"
    end
  end
  
  def paid?
    self.paid
  end

  def pay!
    self.update_attribute("paid", true)
  end

  def book!
    self.rooms.map(&:book!)
  end
  
  def turn_rooms_to_avalaible
    self.rooms.each do |room|
      room.update_attribute("status",Room::AVALAIBLE_STATUS)
    end
  end

  def wait_for_transfer
    self.rooms.each(&:wait_for_transfer)
    self.update_attribute("waiting_for_transfer",true)
  end

  def alert_user
    self.user
  end

  
end
