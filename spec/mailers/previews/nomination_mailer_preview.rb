# Preview all emails at http://localhost:3000/rails/mailers/nomination_mailer
class NominationMailerPreview < ActionMailer::Preview
  def confirmation_mail_preview
    NominationMailer.confirmation_email(Nomination.first)
  end

end
