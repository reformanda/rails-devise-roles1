class NominationMailer < ApplicationMailer

  def confirmation_email(nomination)
    puts 'mailing'
    @nomination = nomination
    mail(to: @nomination.nominating_point_of_contact_email, subject: 'Sample Email')
    puts 'sent'
  end

end
