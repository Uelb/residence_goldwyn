#encoding: utf-8
class PagesController < ApplicationController
  
  def summary
    @rooms= Stay.where(id: session[:stay_id].to_i).includes(:rooms).first.rooms
    if @rooms.empty?
      redirect_to rooms_path, :alert => "Vous n'avez pas sélectionné de chambres"
    end
  end

  def payment
    
  end
  
  def before_payment
    
  end
  
  def agency_reservation
    
  end

  def cgv
      
  end
  
  def pro
    
  end
end
