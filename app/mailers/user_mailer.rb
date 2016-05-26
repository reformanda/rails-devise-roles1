class UserMailer < ApplicationMailer

  def account_creation(user, password)

    @user = user
    @password = password
    mail(to: @user.email, bcc: "jwilson1@networkrunners.com,", subject: "USAASC Virtual Boards Account Creation")

  end

end
