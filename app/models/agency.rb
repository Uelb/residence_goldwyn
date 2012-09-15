class Agency < ActiveRecord::Base
  attr_accessible :client_last_name, :client_first_name, :email, :name, :password, :tva_number
  has_many :stays
end
