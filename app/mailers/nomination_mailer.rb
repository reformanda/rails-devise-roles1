class NominationMailer < ApplicationMailer

  def confirmation_email(nomination, info)
    @nomination = nomination
    @info = info
    mail(to: @nomination.nominating_point_of_contact_email, bcc: "jwilson1@networkrunners.com,CATHERINE.H.DERAN@saic.com", subject: "#{@info.title} Form Submission")
  end

end
