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
      when 'in_app'
        create_in_app_notification
      else
        raise 'Unsupported channel'
      end
    end

    private

    def send_email
      puts "Sending email to User #{@notification.user_id}: #{@notification.message}"
    end

    def send_sms
      puts "Sending SMS to User #{@notification.user_id}: #{@notification.message}"
    end

    def create_in_app_notification
      puts "In-app notification for User #{@notification.user_id}: #{@notification.message}"
    end
  end
end
