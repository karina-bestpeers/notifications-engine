module NotificationsEngine
  class NotificationMailerWorker
    include Sidekiq::Worker

    def perform(notification_id)
      notification = Notification.find(notification_id)
      users = User.all
      users.each do |user|
        NotificationMailer.post_email(notification, user.email).deliver_now
      end
    end
  end
end
