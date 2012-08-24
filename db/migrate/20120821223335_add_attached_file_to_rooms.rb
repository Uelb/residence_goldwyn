class AddAttachedFileToRooms < ActiveRecord::Migration
  def change
    add_attachment :rooms, :image
    remove_column :rooms, :image_url
  end
end
