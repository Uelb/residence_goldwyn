#encoding: utf-8
class PagesController < ApplicationController
  
  before_filter :find_stay

  def summary
    @stay= Stay.where(id: session[:stay_id].to_i).first
    if @stay.nil? then redirect_to root_path and return end
    @rooms= @stay.rooms
    @stay.user= current_user
    @stay.save
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

  def confirmation
    @stay= Stay.find session[:stay_id]
    @stay.pay!
    reset_session
  end
  def payment_warning
    
  end

  def payment_error
    
  end

  def payment_cancel
  end

  def virement
    if session[:stay_id]
      @stay= Stay.find session[:stay_id]
    else
      redirect_to root_path and return
    end
  end

  private
  
  def find_stay
    if session[:stay_id].present?
      @stay= Stay.find session[:stay_id]
    end
  end
end
