ActiveAdmin.register Room do

scope :avalaible
scope :reserved
scope :busy
filter :name
filter :dimension
filter :number_of_rooms
filter :day_price
filter :week_price

index do
	column :name
	column :description
	column :dimension
	column :status
	column :number_of_rooms
	column :sleeping
	column :day_price
	column :week_price
	column "Image" do |room|
		link_to(image_tag(room.image.url(:thumb), :height => '100'), admin_room_path(room))
	end
	default_actions 
end

show do |room|
	attributes_table do
		row :name
		row :description
		row :dimension
		row :status
		row :number_of_rooms
		row :sleeping
		row :day_price
		row :week_price
		row :image do
      image_tag(room.image.url(:thumb), :height => '100')
    end
	end
	active_admin_comments
end

form do |f|
  f.inputs "Room Details" do
    f.input :name
    f.input :description
    f.input :status, :as => :select, :collection => [Room::AVALAIBLE_STATUS, Room::BUSY_STATUS, Room::RESERVED_STATUS]
    f.input :number_of_rooms
    f.input :sleeping
    f.input :day_price
    f.input :week_price
    f.input :image
  end
  f.buttons
end
  
end
