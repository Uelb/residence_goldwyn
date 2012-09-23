class AgencyMailer < ActionMailer::Base
  default :from => "no-reply@residencegoldwyn.fr", :bcc => "thomas@oxynum.fr,rudy@oxynum.fr"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agency_mailer.reservation_confirmation.subject
  #
  def reservation_confirmation agency
    @greeting = "Hi"

    mail to: agency.email
  end
end
