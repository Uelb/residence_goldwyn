# encoding: utf-8

class UserMailer < ActionMailer::Base

  def notify_reservation_confirmation(user, password)
    mail :from => "no-reply@residence_goldwyn.com", :to => "thomas@oxynum.fr", :subject => "Votre réservation a bien été prise en compte", :body => "Bonjour, voici vos identifiants vous permettant d'obtenir le récapitulatif de votre réservation sur notre site. email: #{user.email}, mot de passe: #{password} A bientôt"
  end

end
