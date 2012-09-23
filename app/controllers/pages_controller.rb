#encoding: utf-8
class PagesController < ApplicationController
  
  before_filter :find_stay

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
    if session[:agency_id].nil?
      redirect_to root_path, :notice => "Une erreur s'est produite"
    end
  end

  private
  
  def find_stay
    if session[:stay_id].present?
      @stay= Stay.find session[:stay_id]
    end
  end
end
