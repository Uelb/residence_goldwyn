class RoomsController < ApplicationController
  
  def index
    @avalaible= Array.new
    @reserved= Array.new
    if !session[:stay_id].nil?
      stay= Stay.find session[:stay_id].to_i
      @avalaible= Room.avalaible.includes(:stays)
      @reserved= @avalaible.reject do |room|
        if room.stays.empty?
          true
        else
          room.stays.map(&:departure_date).max < stay.arrival_date && room.stays.map(&:arrival_date).min > stay.departure_date
        end
      end
      @avalaible-=@reserved
    end
    @avalaible= Room.avalaible if @avalaible.empty?
    @reserved+= Room.reserved + Room.busy
  end
  
  def show
    @room= Room.find params[:id]
  end
  
end
