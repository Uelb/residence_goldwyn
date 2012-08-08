class Room < ActiveRecord::Base
  attr_accessible :description, :dimension, :name 
  
  has_and_belongs_to_many :stays
  
  validates_presence_of :name
  validates :name, :uniqueness => true 
  
end
