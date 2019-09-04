class SendPendingTasksJob < ApplicationJob
  queue_as :default

  def perform(user)
    @user = user
    PendingMailer.submission(@user.email).deliver_later(wait_until: 0.2.minutes.from_now)
  end
end
