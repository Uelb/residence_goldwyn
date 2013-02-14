ActiveAdmin.register Stay do

	scope :waiting_for_transfer
  
	show do
		attributes_table do
			row :arrival_date
			row :departure_date
			row "Client name" do |stay|
				stay.user.try(:name)
			end
			row "Agency name" do |stay|
				stay.agency.try(:name)
			end
			row :paid
			row :waiting_for_transfer
		end
		panel "Rooms" do
			table_for stay.rooms do
				column :id
				column :name
				column "Acceder a la chambre : " do |room|
					link_to "Acceder", admin_room_path(room)
				end
			end
		end
	end

end
