class AddCapacityToRooms < ActiveRecord::Migration
  def change
  	add_column :rooms, :capacity, :integer

  end
end
