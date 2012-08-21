#encoding: utf-8
class StaysController < ApplicationController  
  
  def new
    @available_rooms= Room.avalaible
  end        
  
  def create
    @stay= Stay.new
    @stay.arrival_date= DateTime.parse params[:stay][:arrival_date]+" 05:00:00 +1"
    @stay.departure_date= DateTime.parse params[:stay][:departure_date]+" 05:00:00 +1"
    @stay.number_of_adults= params[:stay][:number_of_adults]
    @stay.number_of_children= params[:stay][:number_of_children] 
    if @stay.save
      session[:stay_id]= @stay.id 
      redirect_to rooms_path
    else
      redirect_to new_stay_path, :notice => "Il semblerait qu'une erreur se soit produite"
    end
  end
  
  def update_with_rooms
    @stay= Stay.find session[:stay_id]
    @rooms= Room.where(id: params[:room].map { |key,value| value.to_i})
    @stay.rooms += @rooms
    redirect_to payment_path
  end
    
    
  def show
    @stay= Stay.find params[:id] 
  end

end
