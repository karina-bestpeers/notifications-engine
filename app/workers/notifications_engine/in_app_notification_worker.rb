module NotificationsEngine
  class InAppNotificationWorker
    include Sidekiq::Worker

    def perform(notification_id)
      notification = Notification.find(notification_id)
      users = User.all
      users.each do |user|
        notification_log = NotificationsEngine::NotificationLog.new(
          notifications_engine_notifications_id: notification.id,
          user_id: user.id,
          status: "sent",
          notification_type: "in-app"
        )
        notification_log.save
      end
    end
  end
end
