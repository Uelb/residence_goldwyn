#encoding: utf-8
class StaysController < ApplicationController  
  
  def new
  end        
  
  def create
    @stay= Stay.new
    @stay.arrival_date= DateTime.parse params[:stay][:arrival_date]+" 05:00:00 +1"
    @stay.departure_date= DateTime.parse params[:stay][:departure_date]+" 05:00:00 +1"
    @stay.number_of_adults= params[:stay][:number_of_adults]
    @stay.number_of_children= params[:stay][:number_of_children] 
    if @stay.save
      session[:stay_id]= @stay.id 
      redirect_to new_stay_path, :notice => "Le séjour a bien été réservé"
    else
      redirect_to new_stay_path, :notice => "Il semblerait qu'une erreur se soit produite"
    end
  end
    
    
  def show
    @stay= Stay.find params[:id] 
  end

end
