module NotificationsEngine
  class ApplicationMailer < ActionMailer::Base
    default from: ENV["FROM"]
    layout "mailer"
  end
end
