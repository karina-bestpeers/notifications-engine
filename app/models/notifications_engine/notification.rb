module NotificationsEngine
  class Notification < ApplicationRecord
    validates :status, presence: true
    validates :message, presence: true
    validates :user_id, presence: true
    validates :user_details, presence: true
  end
end
