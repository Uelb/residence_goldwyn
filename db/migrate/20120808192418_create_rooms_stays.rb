class CreateRoomsStays < ActiveRecord::Migration
  create_table :rooms_stays, :id => false do |t|
    t.references :room, :stay
  end

  add_index :rooms_stays, [:room_id, :stay_id]
end
