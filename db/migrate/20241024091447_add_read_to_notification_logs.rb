class AddReadToNotificationLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications_engine_notification_logs, :read, :boolean, default: false
  end
end
