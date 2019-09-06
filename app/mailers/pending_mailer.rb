class PendingMailer < ApplicationMailer
  default from: 'eminemko@gmail.com'

  def submission(user)
    @user = user
    mail(to: @user.email, subject: 'New contact page submission')
  end
end
