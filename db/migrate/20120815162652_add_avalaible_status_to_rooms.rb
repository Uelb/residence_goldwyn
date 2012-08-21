class AddAvalaibleStatusToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :status, :string, :default => "avalaible"
  end
end
