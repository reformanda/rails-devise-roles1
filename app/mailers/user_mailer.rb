class UserMailer < ApplicationMailer

  def account_creation(user, password)

    @user = user
    @password = password
    mail(to: @user.email, bcc: "jwilson1@networkrunners.com,CATHERINE.H.DERAN@saic.com", subject: "USAASC Virtual Boards Account Creation")

  end

  def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Welcome')
  end

end
