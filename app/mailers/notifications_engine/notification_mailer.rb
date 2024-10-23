module NotificationsEngine
  class NotificationMailer < ApplicationMailer
    def post_email(notification, user_email)
      @notification = notification
      email = user_email
      mail(to: email, subject: @notification.message)
    end
  end
end
