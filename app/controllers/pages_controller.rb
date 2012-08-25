#encoding: utf-8
class PagesController < ApplicationController
  
  def payment
    @rooms= Stay.where(id: session[:stay_id].to_i).includes(:rooms).first.rooms
    if @rooms.empty?
      redirect_to rooms_path, :alert => "Vous n'avez pas sélectionné de chambres"
    end
  end
  
  def before_payment
    
  end
  
  def agency_reservation
    
  end
  
end
