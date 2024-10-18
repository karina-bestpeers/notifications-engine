module NotificationsEngine
  class NotificationMailer < ApplicationMailer
    def post_email(notification)
      @notification = notification
      email = @notification.user_details["email"]
      mail(to: email, subject: @notification.message)
    end
  end
end
