class CreateStays < ActiveRecord::Migration
  def change
    create_table :stays do |t|
      t.datetime :arrival_date, :null => false 
      t.datetime :departure_date
      t.references :user, :null => false 


      t.timestamps
    end
  end
end
