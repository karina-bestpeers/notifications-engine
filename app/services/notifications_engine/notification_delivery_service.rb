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
      else
        raise 'Unsupported channel'
      end
    end

    private

    def send_email
      NotificationMailer.post_email(@notification).deliver_now
    end

    def send_sms
      begin
        to = "+91" + @notification.user_details["phone_number"]
        message = @notification.message
        from_phone = ENV['TWILIO_PHONE_NUMBER']
        TwilioClient.messages.create(
          from: from_phone,
          to: to,
          body: message
        )
      rescue
        Puts "Unable to send the sms"
      end
    end
  end
end
