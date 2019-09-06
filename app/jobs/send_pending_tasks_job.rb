class SendPendingTasksJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    PendingMailer.submission(@user.email).deliver_later(wait_until: 5.days.from_now)
  end
end
