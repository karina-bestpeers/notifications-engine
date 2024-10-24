module NotificationsEngine
  class NotificationMailer < ApplicationMailer
    def post_email(notification, user_email)
      @notification = notification
      mail(to: user_email, subject: @notification.message)
    end
  end
end
