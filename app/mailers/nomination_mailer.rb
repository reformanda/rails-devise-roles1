class NominationMailer < ApplicationMailer

  def confirmation_email(nomination, info)
    puts 'mailing'
    @nomination = nomination
    @info = info
    mail(to: @nomination.nominating_point_of_contact_email, bcc: "jwilson1@networkrunners.com,CATHERINE.H.DERAN@saic.com", subject: "#{@info.year} #{@info.title} Form Submission")
    puts 'sent'
  end

end
