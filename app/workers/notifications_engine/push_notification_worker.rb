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
          TwilioClient.messages.create(
            from: from_phone,
            to: to,
            body: "#{message} by #{user.email}"
          )
        rescue
          next
        end
      end
    end
  end
end