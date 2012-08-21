class AddNumberOfRoomsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :number_of_rooms, :integer, :default => 1
    add_column :rooms, :sleeping, :string
  end
end
