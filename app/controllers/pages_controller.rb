class PagesController < ApplicationController
  
  def payment
    @rooms= Stay.where(id: session[:stay_id].to_i).includes(:rooms).first.rooms
  end
  
end
