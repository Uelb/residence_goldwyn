class AddDayAndWeekPriceToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :day_price, :integer
    add_column :rooms, :week_price, :integer
  end
end
