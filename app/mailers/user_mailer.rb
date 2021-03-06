# encoding: utf-8

class UserMailer < ActionMailer::Base

	default :from => "no-reply@residencegoldwyn.fr", :bcc => "thomas@oxynum.fr,rudy@oxynum.fr"

  def notify_reservation_confirmation(user, password="")
    @user= user
    @password= password
    mail :to => user.email, :subject => "Votre réservation à Résidence Goldwyn a bien été prise en compte"
  end

  def alert_for_virement(user, stay=nil)
  	@user=user
  	@stay= stay

  	mail :to => user.email, :subject => "Virement RésidenceGoldwyn en attente"
  end

end
