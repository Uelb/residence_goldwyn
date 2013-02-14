class StaysController < ApplicationController  
  
  def new
    @stay= Stay.find session[:stay_id] unless session[:stay_id].nil?
    @images_to_display= SupersizedImage.visible.map do |supersized|
      supersized.image.url
    end
  end        
  
  def create
    if session[:stay_id].nil?
      @stay= Stay.new
    else
      @stay = Stay.find session[:stay_id].to_i
    end
    @stay.arrival_date= DateTime.parse params[:stay][:arrival_date]+" 05:00:00 +1"
    @stay.departure_date= DateTime.parse params[:stay][:departure_date]+" 05:00:00 +1"
    @stay.number_of_adults= params[:stay][:number_of_adults]
    @stay.number_of_children= params[:stay][:number_of_children] 
    if params[:stay][:arrival_date]!="" && params[:stay][:departure_date]!="" && @stay.save
      session[:stay_id]= @stay.id 
      redirect_to rooms_path
    else
      redirect_to root_path, :alert => t(:date_empty_error)
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
    @stay.rooms = @rooms
    redirect_to before_payment_path
  end
    
    
  def show
    @stay= Stay.find params[:id] 
  end

  def waiting_for_transfer
    @stay= Stay.find session[:stay_id]
    @stay.wait_for_transfer
    reset_session
  end

end
