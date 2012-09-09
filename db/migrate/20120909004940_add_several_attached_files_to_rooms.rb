class AddSeveralAttachedFilesToRooms < ActiveRecord::Migration
  def change
    add_attachment :rooms, :image_2
    add_attachment :rooms, :image_3
    add_attachment :rooms, :image_4
    add_attachment :rooms, :image_5
  end
end
