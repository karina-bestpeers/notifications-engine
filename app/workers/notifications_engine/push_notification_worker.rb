module NotificationsEngine
  class PushNotificationWorker
    include Sidekiq::Worker

    def perform(notification_id)
      notification = Notification.find(notification_id)
      users = User.all
      users.each do |user|
        begin
          to = "+91" + user.phone_number
          message = notification.message
          from_phone = ENV['TWILIO_PHONE_NUMBER']
          result = TwilioClient.messages.create(
            from: from_phone,
            to: to,
            body: "#{message}. please check it our new post in our webite: with your account #{user.email}"
          )
          status = result.error_code.nil? ? "sent" : "failed"
        rescue
          status = "failed"
        end
        notification_log = NotificationsEngine::NotificationLog.new(
          notifications_engine_notifications_id: notification.id,
          user_id: user.id,
          status: status,
          notification_type: "sms"
        )
        notification_log.save
      end
    end
  end
end