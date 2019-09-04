class PendingMailer < ApplicationMailer
  def submission(user)
    @user = user
    mail(to: @user.email, subject: 'New contact page submission')
  end
end
