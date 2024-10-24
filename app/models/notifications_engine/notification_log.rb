module NotificationsEngine
  class NotificationLog < ApplicationRecord
    belongs_to :notification, class_name: 'NotificationsEngine::Notification', foreign_key: 'notifications_engine_notifications_id'
  end
end
