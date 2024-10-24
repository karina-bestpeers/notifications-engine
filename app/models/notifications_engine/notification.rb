module NotificationsEngine
  class Notification < ApplicationRecord

    has_many :notification_logs, class_name: 'NotificationsEngine::NotificationLog', dependent: :destroy

    validates :status, presence: true
    validates :message, presence: true
  end
end
