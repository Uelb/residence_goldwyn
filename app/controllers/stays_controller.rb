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
  
  def edit
    @stay= Stay.find params[:id]
    rooms_id= params[:room].select{ |key,value| value == "1" }
    @rooms= Room.where(id: rooms_id.map { |key,value| key.to_i})
    if @rooms.empty?
      redirect_to rooms_path, :alert => "Vous n'avez pas choisi de chambre" and return
    # elsif @rooms.map(&:capacity)reject(&:nil?).sum < (@stay.number_of_children + @stay.number_of_adults)
    #   redirect_to rooms_path, :alert => "Vous avez choisi des chambres offrant une capacité de #{@rooms.map(&:capacity).sum}, cependant vous avez indiqué #{@stay.number_of_children + @stay.number_of_adults} personnes pour ce séjour." and return
    end 
    @stay.rooms += @rooms
    redirect_to before_payment_path
  end
    
    
  def show
    @stay= Stay.find params[:id] 
  end

end
