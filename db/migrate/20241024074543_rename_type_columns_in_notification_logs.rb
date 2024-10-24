class RenameTypeColumnsInNotificationLogs < ActiveRecord::Migration[7.1]
  def change
    rename_column :notifications_engine_notification_logs, :type, :notification_type
  end
end
