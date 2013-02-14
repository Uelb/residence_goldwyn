class AdminMailer < ActionMailer::Base
  default :from => "no-reply@residencegoldwyn.fr", :to => "samy@oxynum.fr", :bcc => "thomas@oxynum.fr,rudy@oxynum.fr"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agency_mailer.reservation_confirmation.subject
  #
  def new_user_waiting_for_approval agency
    @agency = agency

    mail
  end
end
