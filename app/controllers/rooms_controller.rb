class RoomsController < ApplicationController
  
  def index
    if !session[:stay_id].nil?
      @stay= Stay.find session[:stay_id]
    else
      redirect_to new_stay_path and return
    end
    rooms= Room.all
    @avalaible= rooms.select{ |room| !(room.is_reserved? @stay)}
    @reserved= rooms - @avalaible
  end
  
  def show
    if session[:stay_id].nil?
      redirect_to new_stay_path
    else
      @room= Room.find params[:id]
    end
  end
  
end
