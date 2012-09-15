class SupersizedImage < ActiveRecord::Base
	scope :visible, where(:visible => true)
  attr_accessible :visible, :image
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" }
  validates :image, :attachment_presence => true
end
