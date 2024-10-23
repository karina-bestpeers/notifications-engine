module NotificationsEngine
  class NotificationDeliveryService
    def initialize(notification)
      @notification = notification
    end

    def send!
      case @notification.channel
      when 'email'
        send_email
      when 'sms'
        send_sms
      when 'all'
        send_email
        send_sms
      when 'in-app'

      else
        raise 'Unsupported channel'
      end
    end

    private

    def send_email
      NotificationsEngine::NotificationMailerWorker.perform_async(@notification.id)
    end

    def send_sms
      NotificationsEngine::PushNotificationWorker.perform_async(@notification.id)
    end
  end
end
