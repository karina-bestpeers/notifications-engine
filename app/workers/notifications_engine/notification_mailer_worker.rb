module NotificationsEngine
  class NotificationMailerWorker
    include Sidekiq::Worker

    def perform(notification_id)
      notification = Notification.find(notification_id)
      users = User.all
      users.each do |user|
        begin
          result = NotificationMailer.post_email(notification, user.email).deliver_now
          status = notification.message == result.subject ? "sent" : "failed"
        rescue
          status = "failed"
        end
        NotificationLog.create(
          notifications_engine_notifications_id: notification.id,
          user_id: user.id,
          status: status,
          notification_type: "email"
        )
      end
    end
  end
end
