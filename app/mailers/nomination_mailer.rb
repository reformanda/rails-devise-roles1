class NominationMailer < ApplicationMailer

  def confirmation_email(nomination)
    @nomination = nomination
    mail(to: @nomination.nominating_point_of_contact_email, subject: 'Sample Email')
  end

end
