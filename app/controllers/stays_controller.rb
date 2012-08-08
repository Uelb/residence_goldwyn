#encoding: utf-8
class StaysController < ApplicationController  
  
  def new
  end        
  
  def create
    @user= User.new params[:user]
    @stay= Stay.new params[:stay]
    password= SecureRandom.hex(10)
    @user.password= password
    @user.password_confirmation= password
    if @user.save
      @stay.user_id= @user.id 
      if @stay.save 
        UserMailer.notify_reservation_confirmation @user, password
        redirect_to new_stay_path, :notice => "Le séjour a bien été réservé"
      else
        redirect_to new_stay_path, :notice => "Il semblerait qu'une erreur se soit produite, vérifiez la date de départ"
      end
    else
      redirect_to new_stay_path, :notice => "L'utilisateur existe déjà ou Vous n'avez pas correctement entré vos coordonnées"
    end 
  end         
  
  def show
    @stay= Stay.find params[:id] 
  end

end
