class Agency < ActiveRecord::Base
  attr_accessible :commentary, :client_last_name, :client_first_name, :email, :name, :password, :tva_number, :address, :mobile_phone, :phone, :zip_code
  validates_presence_of :name, :email, :client_last_name, :client_first_name
  validates :mobile_phone, :length => { :is => 10 }
  validates :phone, :length => { :is => 10 }
  validates :zip_code, :length => {:is => 5}

  has_many :stays
end
