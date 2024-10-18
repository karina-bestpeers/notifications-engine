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
      when 'all'
        send_email
        send_sms
        create_in_app_notification
      else
        raise 'Unsupported channel'
      end
    end

    private

    def send_email
      NotificationMailer.post_email(@notification).deliver_later
    end

    def send_sms
      to = @notification.user_details["phone_number"]
      message = @notification.message
      FROM_PHONE = ENV['TWILIO_PHONE_NUMBER']
      TwilioClient.messages.create(
        from: FROM_PHONE,
        to: to,
        body: message
      )
    end

    def create_in_app_notification
      
    end
  end
end
