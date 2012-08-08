class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, :null => false 
      t.text :description
      t.string :dimension

      t.timestamps
    end
  end
end
